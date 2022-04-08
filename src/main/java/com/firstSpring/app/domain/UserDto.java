package com.firstSpring.app.domain;

import java.util.Date;
import java.util.Objects;

public class UserDto {
    private String uid;
    private String pwd;
    private String email;
    private String name;
    private Date reg_date;

    public UserDto() {}

    public UserDto(String uid, String pwd, String email, String name, Date reg_date) {
        this.uid = uid;
        this.pwd = pwd;
        this.email = email;
        this.name = name;
        this.reg_date = reg_date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserDto userDto = (UserDto) o;
        return Objects.equals(uid, userDto.uid) && Objects.equals(pwd, userDto.pwd) && Objects.equals(email, userDto.email) && Objects.equals(name, userDto.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(uid, pwd, email, name);
    }

    @Override
    public String toString() {
        return "UserDto{" +
                "uid='" + uid + '\'' +
                ", pwd='" + pwd + '\'' +
                ", email='" + email + '\'' +
                ", name='" + name + '\'' +
                ", reg_date=" + reg_date +
                '}';
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }
}
