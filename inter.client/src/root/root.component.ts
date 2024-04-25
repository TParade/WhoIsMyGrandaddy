import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';

interface Person {
  id: number;
  fatherId: number | null;
  motherId: number | null;
  name: string;
  surname: string;
  birthDate: Date;
  identityNumber: string;
  generation: number;
}


@Component({
  selector: 'root-root',
  templateUrl: './root.component.html',
  styleUrl: './root.component.scss'
})
export class RootComponent {
  roots: Person[] = [];
  rootParents: Person[]  = [];
  rootPerson: Person | null | undefined = null;
  searchIdNumber = '';
  loading = false;

  constructor(private http: HttpClient) { }

  getRoot() {
    if (this.loading || !this.searchIdNumber) {
      return;
    }
    this.loading = true;
    let url = `/api/rootascendant?identityNumber=${this.searchIdNumber}`;

    this.http.get<Person[]>(url).subscribe(
      result => {
        this.roots = result;

        this.rootPerson = this.roots.find(n => n.generation == 1);
        this.rootParents = this.roots.filter(person => person.fatherId === null || person.motherId === null);
        this.loading = false;
      },
      error => {
        console.error(error);
        this.loading = false;
      }
    );
  }

  search() {
    this.roots = [];
    this.getRoot();
  }
}
