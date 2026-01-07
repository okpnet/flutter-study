import 'package:flutter/material.dart';
import 'package:teste/auth_service.dart';
import 'package:teste/models/user_entity.dart';
import 'package:teste/screens/auth_screen.dart';

class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
    final AuthService _authService = AuthService();
    UserEntity? _user;
    bool _isLoading = false;
    String? _errorMessage;

    @override
    void initState() {
        super.initState();
        WidgetsBinding.instance.addObserver(this);
        _loadUserInfo();
    }

    @override
    void dispose() {
        WidgetsBinding.instance.removeObserver(this);
        super.dispose();
    }

    @override
    void didChangeAppLifecycleState(AppLifecycleState state) {
        if(state==AppLifecycleState.resumed){
            _checkAuthState();
        }
    }

    Future<void> _checkAuthState() async {
        try{
            final needsAuth=await _authService.needsAuthentication();
            if(needsAuth && mounted){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder:(context)=>const AuthScreen()),
                );
            }
        }catch(e){
            // Silent fail for background checks
        }
    }

    Futer<void> _loadUserInfo() async{
        setState((){
            _isLoading=true;
            _errorMessage=null;
        });

        try{
            final userEntity=await _authService.getUserInfo();
            setState((){
                _user=userEntity;
                _isLoading=false;
            });
        }catch(e){
            _setError('Failed to load user information: ${e.toString()}');
        }
    }

    Futer<void> _handleLogout() async{
        setState((9=>_isLoading=true));

        try{
            await _authService.logout();
            if(mounted){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder:(context)=>const AuthScreen()),
                );
            }
        }catch(e){
           _setError('Logout error: ${e.toString()}');
        }finally{
            if(mounted){
                setState((9=>_isLoading=false));
            }
        }
    }

    void _setError(String message) {
        setState(() {
            _isLoading = false;
            _errorMessage = message;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor:Colors.black,
            appBar: AppBar(
                backgroundColor:Colors.black,
                elevation:0,
                title:const Text(
                    'Profile',
                    style:TextStyle(
                        color:Colors.white,
                        fontSize:20,
                        fontWeight:FontWeight.w300,
                    ),
                ),
                actions: [
                    IconButton(
                        icon:Icon(Icons.refresh,color:Colors.grey[400]),
                        onPressed:_isLoading?null:_loadUserInfo,
                        tooltip:'Refresh',
                    ),
                ],
            ),
            body:_buildBody,
        );
    }

    Widget _buildBody() {
        return SafeArea(
            child:RefreshIndicator(
                backgroundColor:Colors.grey[900],
                color:Colors.white,
                onRefresh:_loadUserInfo,
                child:SingleChildScrollView(
                    pyhsics:const AlwaysScrollableScrollPhysics(),
                    child:Container(
                        constraints:BoxConstraints(
                            minHeight:MediaQuery.of(context).size.height- kToolbarHeight - MediaQuery.of(context).padding.top,
                        ),
                        padding:const EdgeInsets.all(32.0),
                        child:Column(
                            mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                                if(_errorMessage!=null) _buidlErrorCard(),
                                if(_isLoading) _buildLoadingIndicator(),
                                if(_user!=null)_buildUserCard(),
                            ],
                        ),

                    ),
                ),
            ),
        );
    }

    Widget _buidlErrorCard() {
        return Container(
            margin:const EdgeInsets.only(bottom:24),
            padding:const EdgeInsets.all(16),
            decoration:BoxDecoration(
                color:Colors.red[900]?.withOpacity(0.2),
                border:Border.all(color:Colors.red[800]!),
                borderRadius:BorderRadius.circular(8),
            ),
            child:Row(
                children:[
                    Icon(Icons.error_outline,color:Colors.red[300],size:20),
                    const sizedBox(width:12),
                    Expanded(
                        child:Text(
                            _errorMessage!,
                            style:TextStyle(color:Colors.red[300],fontSize:14,),
                        ),
                    ),
                    GestureDetector(
                        onTap:()=>setState(()=>_errorMessage=null),
                        child:Icon(Icons.close,color:Colors.red[300],size:20),
                    ),
                ],
            ),
        );
    }

    Widget _buildLoadingIndicator() {
        return Container(
            margin:const EdgeInsets.only(bottom:24),
            child:Column(
                children:[
                    SizeeBox(
                        width:32,
                        height:32,
                        child:CircularProgressIndicator(
                            strokewidhth:2,
                            valueColor:AlwaysStoppedAnimation<Color>(Colors.grey[400]!),
                        ),
                    ),
                    const SizedBox(height:16),
                    Text(
                        'Loading profile...',
                        style:TextStyle(color:Colors.grey[500],fontSize:14),
                    ),
                ],
            ),
        );
    }

    Widget _buildUserCard() {

    }
}