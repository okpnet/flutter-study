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
    }
}