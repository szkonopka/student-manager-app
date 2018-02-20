export class Student {
    ID : number;
    Name : string;
    Surname : string; 
    DateOfBirth : Date; 
    City : string;
    constructor(
        ID : number,
        Name : string,
        Surname : string,
        DateOfBirth : Date,
        City : string
    ) {
        this.ID = ID;
        this.Name = Name;
        this.Surname = Surname;
        this.DateOfBirth = DateOfBirth;
        this.City = City;
    }
}
