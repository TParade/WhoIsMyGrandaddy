import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DescendantComponent } from '../descendant/descendant.component';
import { RootComponent } from '../root/root.component';



const routes: Routes = [
  { path: 'familytreeviewer', component: DescendantComponent },
  { path: 'rootascendant', component: RootComponent },
  { path: '', redirectTo: '/familytreeviewer', pathMatch: 'full' } // Default route
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
