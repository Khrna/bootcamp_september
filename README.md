# Practice Test Automation Framework

This repository contains an automated testing framework for the Practice Test Automation website, specifically focusing on login functionality testing. The framework is built using Robot Framework with Browser Library.

## Project Structure

```
bootcamp/
├── tests/
│   └── login_test.robot        # Test cases for login functionality
├── resources/
│   ├── keywords/
│   │   └── login_page.resource # Page object model for login page
│   └── variables/
│       └── test_data.resource  # Test data and configuration variables
└── venv/                       # Python virtual environment
```

## Prerequisites

- Python 3.x
- Node.js (Latest LTS version)
- Git (for version control)

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone [repository-url]
   cd bootcamp
   ```

2. Create and activate Python virtual environment:
   ```bash
   python -m venv venv
   .\venv\Scripts\activate  # Windows
   source venv/bin/activate # Linux/Mac
   ```

3. Install required packages:
   ```bash
   pip install robotframework robotframework-browser
   ```

4. Initialize Browser library:
   ```bash
   python -m Browser.entry init
   ```

## Running Tests

To run all tests:
```bash
robot tests/login_test.robot
```

To run specific test cases:
```bash
robot -t "Successful Login Test" tests/login_test.robot
```

## Test Cases

The framework includes both positive and negative test scenarios:

- Successful login with valid credentials
- Login attempts with invalid username
- Login attempts with invalid password
- Login attempts with empty fields

## Configuration

Test configuration can be modified in `resources/variables/test_data.resource`:

- Browser selection (default: chromium)
- Headless mode toggle
- Base URL
- Test credentials

## Development Guidelines

### For Humans

1. Follow the Page Object Model pattern
2. Keep test data separate from test logic
3. Use meaningful names for variables and keywords
4. Add comments for complex logic
5. Maintain consistent formatting

### For AI Agents

1. File Locations:
   - Test files: `tests/*.robot`
   - Keywords: `resources/keywords/*.resource`
   - Variables: `resources/variables/*.resource`

2. Important Patterns:
   - Wait statements use `Wait For Elements State` with 5s timeout
   - Success/error conditions use Promise.race
   - Page objects follow Robot Framework resource file format

3. Code Patterns:
   ```robotframework
   *** Settings ***
   Library    Browser
   Resource   ../variables/test_data.resource

   *** Variables ***
   ${ELEMENT_LOCATOR}    css=.selector

   *** Keywords ***
   Keyword Name
       [Arguments]    ${arg1}    ${arg2}
       Wait For Elements State    ${ELEMENT_LOCATOR}    visible    timeout=5s
   ```

## Contributing

1. Create a feature branch
2. Make changes following the project structure
3. Add/update tests as needed
4. Submit a pull request

## Troubleshooting

Common issues and solutions:

1. Browser library initialization fails:
   - Verify Node.js installation
   - Run `python -m Browser.entry init` again

2. Test execution fails:
   - Check virtual environment activation
   - Verify all dependencies are installed
   - Check element selectors in test files

## License

[Specify your license here]

---
Last updated: September 24, 2025