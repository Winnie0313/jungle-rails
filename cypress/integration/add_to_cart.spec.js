describe('add to cart', () => {
  
  it("users can navigate from the home page to the product detail page by clicking on a product", () => {
    cy.visit('/')

    cy.get('.products article button').first().click('bottomRight', { force: true })

    cy.get('#cart_nav_link').contains('My Cart (1)')
  });

})