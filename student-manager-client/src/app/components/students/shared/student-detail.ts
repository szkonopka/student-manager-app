export class StudentDetail {
    ID: number;
    Name: string;
    NumberEquivalent: string;
    LetterEquivalent: string;
    constructor(
        id: number, name: string, numberEquivalent: string, letterEquivalent: string
    ) {
        this.ID = id;
        this.Name = name;
        this.NumberEquivalent = numberEquivalent;
        this.LetterEquivalent = letterEquivalent;
    }
}
