describe('product details', () => {
  
  it("users can navigate from the home page to the product detail page by clicking on a product", () => {
    cy.visit('/')

    cy.get('.products article a').first().click()

    cy.get('.products-show').should('be.visible')
  });




 

})