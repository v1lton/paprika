# Paprika

<!-- Git Flow -->
## Git Flow

### Add new Feature or fix a Bug

1. Create your Feature or Fix Branch
  * `git checkout -b feature/AmazingFeature`
  * `git checkout -b fix/AmazingFix`
2. Commit your Changes
  * `git commit -m 'Feature(AmazingFeature): Add some AmazingFeature`
  * `git commit -m 'Fix(AmazingFix): Fixes a bug`
3. Push to the Branch
  * `git push origin feature/AmazingFeature`
  * `git push origin fix/AmazingFix`
4. Open a Pull Request in Github's Pull request tab and fill it with the above Pull Request Template.
5. If the Pull Request is not able to merge automatically do the following steps while on your branch:
```sh
git pull develop
```
6. Solves conflicts in Xcode, and commit your changes
7. Add reviewers to your Pull Request and wait for approval.

## Pull Request Template
```sh
### Issue Name
**What I did:**

- First thing I did...

- Second thing I did...

**How to test:**

- Brief notes on how to check if the feature works correctly.
```
