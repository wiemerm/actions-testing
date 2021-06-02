## Welcome to GitHub Pages

You can use the [editor on GitHub](https://github.com/Richard-Gist/actions-testing/edit/documentation/docs/index.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/Richard-Gist/actions-testing/settings/pages). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://support.github.com/contact) and we’ll help you sort it out.




![Build Status](https://github.com/wwt/Workflow/actions/workflows/CI.yml/badge.svg?branch=main)
![Pod Version](https://img.shields.io/cocoapods/v/DynamicWorkflow.svg?style=popout)
![Quality Gate](https://img.shields.io/sonar/quality_gate/wwt_Workflow?server=https%3A%2F%2Fsonarcloud.io)
![Coverage](https://img.shields.io/sonar/coverage/wwt_Workflow?server=http%3A%2F%2Fsonarcloud.io)

### Welcome to Workflow!
Workflow is a library meant to handle complex user flows in iOS applications.

#### Table of Contents:
- [Installation](https://github.com/wwt/Workflow/wiki/Installation)
- [Why Workflow?](https://github.com/wwt/Workflow/wiki/Why-This-Library%3F)
- [Getting Started](https://github.com/wwt/Workflow/wiki/getting-started)
- [Testing Your Workflows](https://github.com/wwt/Workflow/wiki/testing)
- [Advanced](https://github.com/wwt/Workflow/wiki/advanced)
- [Developer Documentation](https://gitcdn.link/repo/wwt/Workflow/main/docs/index.html)
- [Upgrade Path](https://github.com/wwt/Workflow/blob/main/UPGRADE_PATH.md)
- [FAQ](https://github.com/wwt/Workflow/wiki/faq)

### The problem Workflow was built to solve:
When developing for iOS one view controller has to know about the one following it in order to pass along data. Imagine a workflow for a fast food app.

Pick a location -> Pickup or Delivery -> Catering Menu or Normal Menu -> Choose Food -> Review Order -> Submit payment

Now imagine if a users location is known via GPS. You may be able to skip the first screen and assume the nearest location knowing they can edit it on the review screen. Pickup or Delivery may or may not need to show up depending on what the location they picked supports. The same is true with catering menu vs normal menu

Finally the review screen would be really nice if it gave a way to edit. This spells a nightmare for you if you utilize segues. You'll have to use many of them, and if the design of this user flow changes you're in for a bit of an annoying time changing them around.


### The solution
Workflow lets you specify once what the whole workflow looks like, then each view controller defines whether it should show up or not, so to solve the above problem you'd use something like this.

```swift
let workflow = Workflow()
                .thenPresent(LocationsViewController.self)
                .thenPresent(PickupOrDeliveryViewController.self)
                .thenPresent(MenuChooserViewController.self)
                .thenPresent(FoodChooserViewController.self)
                .thenPresent(ReviewOrderViewController.self)
                .thenPresent(SubmitPaymentViewController.self)

// from wherever this flow is launched
launchInto(workflow)
```

If you ever want to re-order these you simply move their position in the chain. Your view controllers will naturally start to become defined in a way where they can be injected into any kind of workflow, and so if for scheduled orders you want screens to show up in a different order, you just define a new `Workflow`.
