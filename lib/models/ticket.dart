import 'package:equatable/equatable.dart';
import 'package:google_signin_example/models/space.dart';

class Ticket extends Equatable {
  final Space space;
  final Field field;
  final DateTime time;
  final String bookingCode;
  // final List<String> seats;
  final String name;
  final int totalPrice;

  Ticket(this.space, this.field, this.time, this.bookingCode,
       this.name, this.totalPrice);

  Ticket copyWith(
          {Space space,
          Field field,
          DateTime time,
          String bookingCode,
          // List<String> seats,
          String name,
          int totalPrice}) =>
      Ticket(
          space ?? this.space,
          field ?? this.field,
          time ?? this.time,
          bookingCode ?? this.bookingCode,
          // seats ?? this.seats,
          name ?? this.name,
          totalPrice ?? this.totalPrice);

  // String get seatsInString {
  //   String s = '';

  //   for (var seat in seats) {
  //     s += seat + ((seat != seats.last) ? ', ' : '');
  //   }

  //   return s;
  // }

  @override
  List<Object> get props => [space, field, time, bookingCode,  name, totalPrice];
}