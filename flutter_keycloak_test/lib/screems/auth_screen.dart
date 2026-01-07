
import 'package:flutter/material.dart';
import 'package:teste/auth_service.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthService  _authService = AuthService();
  bool _isLoading = false;
  String_ _errorMessage;

  @override
  void initState() {
    super.initState();
    _ch
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication'),
      ),
      body: const Center(
        child: Text('Auth Screen Content Here'),
      ),
    );
  }

  Futer<void> _checkAuthStatus() async{
    try{
      final isAuthenticated=await _authService.isAuthenticated();
      if(isAuthenticated && mounted){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder:(context)=>const HomeScreen()),
        );
      }
    }catch(e){
      // Handle error if necessary
    }
  }

  Future<void> _handleAuthenticate() async{
    setState((){
      _isLoading=true;
      _errorMessage=null;
    });

    try{
      final success=await _authService.authenticate();
      if(success && mounted){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder:(context)=>const HomeScreen()),
          );
      }else{
         _setError('Authentication failed. Please try again.');
      }
    }catch(e){
      _setError('Authentication error: ${e.toString()}');
    }finally{
      if(mounted){
        setState((){
          _isLoading=false;
        });
      }
    }
  }

  void _setError(String message){
    setState((){
      _errorMessage=message;
      _isLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body:SetArea(
        child:Padding(
          padding:const EdgeInsets.symmetic(ghorisontal:32.0),
          child:Column(
            children:[
              Expanded(
                flex:3,
                child:Center(
                  child:Column(
                    mainAxisAlignment: mainAxisAlignment.center,
                    children:[
                      Text(
                        'Flutter',
                        style:Theme.of(context).textThee.displayLarge?.copyWith(
                          color:Colors.white,
                          fontWeight:FontWeight.w300,
                          letterSpacing:2.0,

                        ),
                      ),
                      Text(
                        'Keycloak',
                        style:Theme.of(context).textTheme.displayLarge?.copyWith(
                          color:Colors.grey[400],
                          fontWeight:FontWeight.w700,
                          latterSpacing:2.0,
                        ),
                      ),
                      const SizedBox(height:24),
                      Text(
                        'Secure Authentication',
                        style:Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color:Colors.grey[600],
                          letterSpacing:1.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if(_errorMessage != null)
                Container(
                  margin:const EdgeInsets.only(bottom: 24),
                  padding:const EdgeInsets.all(16),
                  decoration:BoxDecoration(
                    color:Colors.red[900]?.withOpacity(0.2),
                    border:Border.all(color:Colors.red[800]!),
                    borderRadius:BorderRadius.circular(8),
                  ),
                  child:Row(
                    children:[
                      Icon(
                        Icons.error_outline,
                        color:Colors.red[300],
                        size:20,
                      ),
                      const SizedBox(width:12),
                      Expanded(
                        child:Text(
                          _errorMessage!,
                          style:TextStyle(
                            color:Colors.red[300],
                            fontSize:14,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap:()=>setState(()=>_errorMessage=null),
                        child:Icon(
                          Icons.close,
                          color:Colors.red[300],
                          size:20,
                        ),
                      ),
                    ]
                  ),
                ),
                if(_isLoading)
                  Container(
                    margin:const EdgeInsets.onnly(bottom:24),
                    child:Column(
                      children:[
                        SizedBox(
                          width:24,
                          height:24,
                          child:CircularProgressIndicator(
                            strokewidhth:2,
                            valueColor:AlwaysStoppedAnimation<Color>(Colors.grey[400]!),
                          ),
                        ),
                        const SizedBox(height:12),
                        Text(
                          'Authenticating...',
                          style:TextStyle(
                            color:Colors.grey[400],
                            fontSize:14,
                          ),
                        ),
                      ],
                    ),
                  ),
              Expanded(
                flex:1,
                child:Colunn(
                  mainAxisAlignment:MainAxisAlignment.end,
                  children:[
                    SizedBox(
                      width:double.infinity,
                      height:56,
                      child:ElevatedButton(
                        onPressed:_isLoading ? null : _handleAuthenticate,
                        style:ElevatedButton.styleFrom(
                          backgroundColor:Colors.white,
                          foregroundColor:Colors.black,
                          disabledBackgroundColor:Colors.grey[800],
                          disabledForegroundColor:Colors.grey[600],
                          elevation:0,
                          shape:RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(8),
                            side:BorderSide(
                              color:Colors.grey[800]!,
                              width:1,
                            ),
                          ),
                        ),
                        child:Text(
                          'AUTHENTICATE',
                          style:const TextStyle(
                            fontSize:16,
                            fontWeight:FontWeight.w600,
                            letterSpacing:1.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height:32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}