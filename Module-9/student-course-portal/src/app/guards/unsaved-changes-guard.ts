import { CanDeactivateFn } from '@angular/router';

export const unsavedChangesGuard: CanDeactivateFn<any> = (component) => {

  if (component.hasUnsavedChanges) {
    return confirm('You have unsaved changes. Leave this page?');
  }

  return true;

};