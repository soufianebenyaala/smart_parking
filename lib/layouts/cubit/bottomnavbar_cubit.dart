import 'package:flutter/material.dart';
import 'package:smartparkingv2/Screens/Cars/cars_screen.dart';
import 'package:smartparkingv2/Screens/Parkings/parkings_screen.dart';
import 'package:smartparkingv2/Screens/Resarvation/resevation_screen.dart';
import 'package:smartparkingv2/Screens/UserProfile/user_profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Screens/Home/home_screen.dart';

part 'bottomnavbar_state.dart';

class BottomnavbarCubit extends Cubit<BottomnavbarState> {
  BottomnavbarCubit() : super(BottomnavbarInitial());

  static BottomnavbarCubit get(context)=>BlocProvider.of(context);

  List<Widget> screens = [HomeScreen(),CarsScreen(),ReservationScreen(),UserProfileScreen()];

  int currentIndex = 0;

  void changeBottomNav (int index){
    currentIndex = index ;
    print(currentIndex);
    emit(ChangeIndexBottomNavBar());
  }
}
