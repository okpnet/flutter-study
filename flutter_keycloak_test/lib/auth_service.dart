import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'models/user_entity.dart';

class AuthService{
    static const FlutterAppAuth _appAuhth=FlutterAppAuth();
    static const FlutterSecureStorage _secureStorage=FlutterSecureStorage(
        aOptions: AndroidOptions(
            encryptedSharedPreferences: true,
        ),
    );
    // Configuration
    static const String _keycloakUrl='';
    static const String _realm='';
    static const String _clientId='';
    static const String _redirectUrl='';
    static const List<String> _scope=[];
    // Token Storage Keys
    static const String _accesTokenKey='';
    static const String _refreshTokenKey='';
    static const String _idTokenKey='';
    static const String _tokenExprirationKey='';

    Future<bool> authenticate() async {
        try{
            const config=AuthorizationServiceConfiguration(
                authorizationEndpoint: '$_keycloakUrl/realms/$_realm/protocol/openid-connect/auth',
                tokenEndpoint: '$_keycloakUrl/realms/$_realm/protocol/openid-connect/token',
                endSessionEndpoint: '$_keycloakUrl/realms/$_realm/protocol/openid-connect/logout',
            );
            final AuthorizationTokenResponse result=await _appAuhth.authorizeAndExchangeCode(
                AuthorizationTokenRequest(
                    _clientId,
                    _redirectUrl,
                    serviceConfiguration: config,
                    scopes: _scope,
                    allowInsecureConnections:true,
                    externalUserAgent: ExternalUserAgent.asWebAuthenticationSession,
                    promptValues: ['login'],
                    additionalparameters: {
                        'kc_action':'AUTHENTICATE',
                    },
                ),
            );

            if(result._accesToken==null){
                throw Exception('Authentication failed - no access token received');
            }

            await _storeTokens(result);
            developer.log('Authentication successful', name: 'AuthService');
            return true;
        }catch(e){
            developer.log('Authentication failed: $e', name: 'AuthService');
            return false;
        }
    }

    Future<void> _storeTokens(AuthorizationTokenResponse result) async {
        await _secureStoreage.write(key: _accesTokenKey, value: result.accessToken);

        if(result.refreshToken != null){
            await _secureStorage.write(key: _refreshTokenKey, value: result.refreshToken);
        }

        if(result.idToken != null){
            await _secureStorage.write(key: _idTokenKey, value: result.idToken);
        }
        if(result.accessTokenExpirationDateTime != null){
            await _secureStorage.write(
                key: _tokenExprirationKey,
                value: result.accessTokenExpirationDateTime!.millisecondsSinceEpoch.toString(),
            );
        }
    }

    Future<void> _storeRefreshedTokens(TokenResponse result) async {
        await _secureStorage.write(key: _accesTokenKey,value: result.accessToken);

        if(result.reshToken != null){
            await _SecureStorege.wtite(key: _refreshTokenKey, value: result.refreshToken);
        }

        if(result.idToken != null){
            await _secureStorage.write(key: _idTokenKey, value: result.idToken);
        }

        if(result.accessTokenExpirationDateTime != null){
            await _secureStorage.write(
                key: _tokenExprirationKey,
                value: result.accessTokenExpirationDateTime!.millisecondsSinceEpoch.toString(),
            );
        }
    }

    Future<UserEntity> getUserInfo() async {
        final token=await _getValidAccessToken();

        final response= await http.get(
            Uri.parse('$_keycloakUrl/realms/$_realm/protocol/openid-connect/userinfo'),
            headers: {
                'Authorization':'Bearer $token',
                'Content-Type':'application/json',
            },
        );

        if(response.statusCode==200){
            try{
                final userInfoJson=json.decode(response.body) as Map<String, dynamic>;
                return UserEntity.fromJson(userInfoJson);
            }catch(e){
                throw Exception('Failed to parse user information: $e');
            }
        }else if(response.statusCode==401){
            await _clearTokens();
            throw Exception('Token expired or invalid');
        }else{
             throw Exception('Failed to retrieve user information: ${response.statusCode}');
        }
    }

    Future<String?> _getValidAccessToken() async {
        final token await getAccessToken();
        if(token==null){
            throw Exception('No access token available');
        }

        if(await _isTokenExpried()){
            final refreshed =await _refreshAccessToken();
            if(!refreshed){
                throw Exception('Token expired and refresh failed');
            }
            return await getAccessToken() ?? '';
        }
        return token;
    }

    Future<bool> _isTokenExpried() async {
        final expirationStr=await _secureStorage.read(key: _tokenExprirationKey);
        if(expirationStr==null){
            return true;
        }

        final exporation=await DateTime.fromMillisecondsSinceEpoch(int.parse(expirationStr));
        final buffer=const Duration(minutes: 5);

        return DateTime.now().add(buffer).isAfter(exporation);
    }

    Future<bool> _refreshAccessToken() async {
        try{
            final refreshToken=await _secureStorage.read(key: _refreshTokenKey);
            if(refreshToken==null){
                developer.log('No refresh token available', name: 'AuthService');
                return false;
            }

            const config=AuthorizationServiceConfiguration(
                authorizationEndpoint: '$_keycloakUrl/realms/$_realm/protocol/openid-connect/auth',
                tokenEndpoint: '$_keycloakUrl/realms/$_realm/protocol/openid-connect/token',
                endSessionEndpoint: '$_keycloakUrl/realms/$_realm/protocol/openid-connect/logout',
            );

            final result=await _appAuhth.token(
                TokenRequest(
                    _clientId,
                    _redirectUrl,
                    serviceConfiguration: config,
                    refreshToken: refreshToken,
                    allowInsecureConnections:true,
                ),
            );

            if(result.accessToken!=null){
                await _storeRefreshedTokens(result);
                developer.log('Token refreshed successfully', name: 'AuthService');
                return true;
            }
            return false;
        }catch(e){
            developer.log('Token refresh failed: $e', name: 'AuthService');
            await _clearTokens();
            return false;
        }
    }

    Future<String> getAccessToken() async {
        return await _secureStorage.read(key: _accesTokenKey);
    }

    Future<bool> isAuthenticated() async {
        final token=await _secureStorage.read(key: _accesTokenKey);
        if(token==null){
            return false;
        }

        if(await _isTokenExpried()){
            final refreshed=await _refreshAccessToken();
            return refreshed;    
        }
        return true;
    }

    Future<bool> logout() async{
        try{
            final idToken=await _getIdToken();
            if(idToken!=null){
                try{
                    const config=AuthorizationServiceConfiguration(
                        authorizationEndpoint: '$_keycloakUrl/realms/$_realm/protocol/openid-connect/auth',
                        tokenEndpoint: '$_keycloakUrl/realms/$_realm/protocol/openid-connect/token',
                        endSessionEndpoint: '$_keycloakUrl/realms/$_realm/protocol/openid-connect/logout',
                    );

                    final endSessionRequest=EndSessionRequest(
                        idTokenHint: idToken,
                        postLogoutRedirectUrl: _redirectUrl,
                        serviceConfiguration: config,
                        allowInsecureConnections:true,
                    );

                    await _appAuhth.endSession(endSessionRequest);
                    developer.log('End session completed successfully', name: 'AuthService');
                }catch(e){
                    developer.log('End session failed, but continuing with local logout: $e', name: 'AuthService');
                }

            }else{
                developer.log('No ID token to logout with', name: 'AuthService');
            }
            await _clearTokens();
            return true;
        }catch(e){
             developer.log('Logout error: $e', name: 'AuthService');
             await _clearTokens();
            return false;
        }
    }

    Future<String?> _getIdToken() async {
        return await _secureStorage.read(key: _idTokenKey);
    }

    Future<void> _clearTokens() async {
        await Future.wait([
            _secureStorage.delete(key: _accesTokenKey),
            _secureStorage.delete(key: _refreshTokenKey),
            _secureStorage.delete(key: _idTokenKey),
            _secureStorage.delete(key: _tokenExprirationKey),
        ]);
    }

    
}