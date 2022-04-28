package com.firstSpring.app.domain;

import java.util.Date;
import java.util.Objects;

public class BoardDto {
    private int bno;
    private String btitle;
    private String bcontent;
    private String bauthor;
    private int view_count;
    private Date reg_date;

    public BoardDto() {}

    public BoardDto(String btitle, String bcontent, String bauthor) {
        this.btitle = btitle;
        this.bcontent = bcontent;
        this.bauthor = bauthor;
    }

    public BoardDto(int bno, String btitle, String bcontent, String bauthor, int view_count, Date reg_date) {
        this.bno = bno;
        this.btitle = btitle;
        this.bcontent = bcontent;
        this.bauthor = bauthor;
        this.view_count = view_count;
        this.reg_date = reg_date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BoardDto boardDto = (BoardDto) o;
        return bno == boardDto.bno && view_count == boardDto.view_count && Objects.equals(btitle, boardDto.btitle) && Objects.equals(bcontent, boardDto.bcontent) && Objects.equals(bauthor, boardDto.bauthor) && Objects.equals(reg_date, boardDto.reg_date);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bno, btitle, bcontent, bauthor, view_count, reg_date);
    }

    @Override
    public String toString() {
        return "BoardDto{" +
                "bno=" + bno +
                ", btitle='" + btitle + '\'' +
                ", bcontent='" + bcontent + '\'' +
                ", bauthor='" + bauthor + '\'' +
                ", view_count=" + view_count +
                ", reg_date=" + reg_date +
                '}';
    }

    public int getBno() {
        return bno;
    }

    public void setBno(int bno) {
        this.bno = bno;
    }

    public String getBtitle() {
        return btitle;
    }

    public void setBtitle(String btitle) {
        this.btitle = btitle;
    }

    public String getBcontent() {
        return bcontent;
    }

    public void setBcontent(String bcontent) {
        this.bcontent = bcontent;
    }

    public String getBauthor() {
        return bauthor;
    }

    public void setBauthor(String bauthor) {
        this.bauthor = bauthor;
    }

    public int getView_count() {
        return view_count;
    }

    public void setView_count(int view_count) {
        this.view_count = view_count;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }
}
