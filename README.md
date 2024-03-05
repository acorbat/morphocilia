# morphocilia
Package for cilia segmentation and morphological description, and bile duct and canaliculi regionalization during development of liver thick sections.

# Development

Remember to always work in a new environment.

You should first ```git clone``` the repository locally and then make a new branch with ```git checkout -b [new_branch]```.

Install ```morphocilia``` in editable mode with tests running.

```
pip install -e .[test]
```

Then install ```pre-commit``` and install the pre-commit hooks (these run at ```git commit``` time and do some checks on the to-be-committed files):

```
pip install pre-commit
pre-commit install
```

## Structure

Modules composing morphocilia should work interconnected as shown below. If needed, a new uml can be created from ```umls.txt```.

![Pipeline](https://www.plantuml.com/plantuml/png/XLJ1RjmW4Btp5GWfjwHIb5iELQBqKgbHrJQtrMg5xOcN1WC5h6fLvTyx0-l5faWz6Hvl1kQz6J-4A7sS9yr-1cluvqcEmFymqH-bCQ23kD-9NcabnJKNJvzkx-ZxDKImpfgeZDYpTyQSxDym41b4vOz6wbDGGM0crji9gM3YSle3nWctu0MNWQVaXx1W6E6inyJdW_Cxw99T3d_ICWJrgi3lItn_0HVQjrcQY4Wlex9cHVsrEM2vxXJp8ZkTYdSsA3eKzw874xrLWxXcGeCPun71UQ8jQEMGTqB0Kox1ti_P7eVXnMvJfhjvF3aWHRMr3WQICaGlrNYCj8ROYpqcxa1RCmOUBVSmfdVmdUYKXiCmzubwF7LUfGIlglEsm_9ZjcBjnfTvKkOYUAgNB2cEj1aebIQyQOleXzixVhObSGauO02O2yUM1jbG4S_Cv6U-l7QgND-sAaKLON-hWJpXQChYqJ6M_HMdfgNzLTvYx-RTyWGmIqjLBm2pQgkjiD-JBVnPkahFP-dVmF-hvvJmGrZX_vKqnsmqRKkwCDcEQjrSlcUxrR1MHrYHiGEMCqdt0NL-pGddw6RAwLBD-OzmS_En6iY25rCBbWgemVBKchaKKFyCaD2UsXQOs6NgM5cMF6j7Qu1OzUWoLar2PhNxiuaIVzsphDKA5MMrpjVLpLW3n5eRLvQyKTC3c66Uz5y0)
