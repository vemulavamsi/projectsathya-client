import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

// const AUTH_API = 'http://localhost:4000/';
// test
const AUTH_API = 'http://172.31.88.20:3000/';
const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  constructor(private http: HttpClient) { }

  login(user_name: string, password: string): Observable<any> {
    return this.http.post(AUTH_API + 'login', {
      user_name,
      password
    }, httpOptions);
  }

  register(user_name: string, email: string, password: string, mobile: string): Observable<any> {
    return this.http.post(AUTH_API + 'register', {
      user_name,
      email,
      password,
      mobile
    }, httpOptions);
  }
}
