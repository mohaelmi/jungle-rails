describe("Jungle rails", () => {
  beforeEach(() => {
    cy.visit("http://127.0.0.1:5678");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("click Add button to add item to the cart", () => {
    cy.get(".button_to .btn").click({ force: true });
  });

  it("cart button should have one item inisde", () => {
    cy.get(".end-0 > .nav-link").should("have.length", 1);
  });
});
