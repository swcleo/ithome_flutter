// NOTE：這邊是js的語法
class DateTime {
    _date = null;

    constructor() {
        this._date = new Date();
    }

    add(num, type) {
        switch (type) {
            case 'days':
                this._addDays(num);
                break;
            default:
        }

        return this;
    }

    setDate(newDate) {
        _date = newDate;
        return _date;
    }

    _addDays(num) {
        this._date.setDate(this._date.getDate() + num);
    }

    toString() {
        return this._date.toString();
    }
}

const date = new DateTime();

// 函式鏈結
const result =
    date
    .setDate(new Date(2021, 8, 2, 0, 0, 0))
    .add(30, 'days')
    .toString();

console.log(result); // Sat Oct 02 2021 00:00:00 GMT+0800 (台北標準時間)