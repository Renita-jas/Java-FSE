import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'duration',
  standalone: true
})
export class DurationPipe implements PipeTransform {

  transform(value: number): string {

    if (value === 1) {
      return '1 Month';
    }

    return value + ' Months';

  }

}