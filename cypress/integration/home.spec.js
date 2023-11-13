

describe('Jungle rails', () => {

  it('visits page', () => {
    cy.visit('http://127.0.0.1:35155/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

})