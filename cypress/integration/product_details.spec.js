describe('Jungle rails', () => {

  it('visits page', () => {
    cy.visit('http://127.0.0.1:5678')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("shows product details when click on product", () => {
    cy.get(".products article").first().click()
  });

  it("there is product details on the page", () => {
    cy.get(".products-show").should('be.visible')
  });

})