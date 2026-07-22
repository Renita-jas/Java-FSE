import { ElementRef } from '@angular/core';
import { describe, expect, it } from 'vitest';

import { HighlightDirective } from './highlight';

describe('HighlightDirective', () => {
  it('should create an instance', () => {
    const directive = new HighlightDirective(new ElementRef(document.createElement('div')));
    expect(directive).toBeTruthy();
  });
});
