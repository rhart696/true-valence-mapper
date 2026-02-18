# Rollback Plan

**Version**: 1.0
**Date**: 2026-02-17
**Based On**: Implementation Plan + Architecture Diagram + QA Strategy
**Product**: True Valence Mapper v1.0

---

## Rollback Plan Overview

**Purpose**: Define safety net procedures if deployment fails or critical issues arise post-deployment.

**Scope**: Deployment rollback, hotfix process, communication plan.

**Timeline**: Immediate rollback capability, hotfix in < 1 hour, communication as needed.

---

## 1. Pre-Deployment Checklist

### 1.1 Quality Gates

**Must Pass Before Deployment**:
- [ ] All unit tests pass (>50% coverage)
- [ ] All integration tests pass
- [ ] All E2E tests pass (Chrome, Safari, Mobile)
- [ ] Lighthouse scores > 90 (Performance, Accessibility, Best Practices)
- [ ] Accessibility audit passed (axe DevTools zero critical errors)
- [ ] Cross-browser tested (Chrome, Edge, Safari, Firefox)
- [ ] Mobile tested (iOS Safari, Chrome Android)
- [ ] Manual testing complete (all scenarios pass)
- [ ] Code reviewed and approved
- [ ] No P0/P1 bugs outstanding

### 1.2 Pre-Deployment Actions

**1. Create Deployment Tag**:
```bash
git tag -a v1.0.0 -m "True Valence Mapper v1.0.0 release"
git push origin v1.0.0
```

**2. Backup Current Production** (if applicable):
- Note: v1.0 is first deployment, no existing production
- For future deployments: Copy production URL/content to backup location

**3. Deploy to Preview**:
```bash
# Vercel automatically deploys preview on git push
# Verify preview deployment works
```

**4. Final QA on Preview**:
- [ ] Test complete session flow on preview URL
- [ ] Verify PDF export works on preview
- [ ] Verify no console errors on preview
- [ ] Verify Lighthouse scores on preview

**5. Notify Team**:
- Send notification: "Deploying v1.0 to production in 10 minutes"
- Include: Preview URL, expected downtime (0 minutes)

---

## 2. Deployment Rollback Triggers

### 2.1 Critical Issues Requiring Immediate Rollback

| Issue | Definition | Impact | Rollback Required? |
|-------|-----------|--------|-------------------|
| App doesn't load | 404, 500, or blank page | Users can't access app | ✅ Yes |
| Core functionality broken | Can't add relationships, score, or export | App unusable | ✅ Yes |
| PDF export fails | PDF generation always fails | Core feature broken | ✅ Yes |
| Security vulnerability | Data breach, XSS, CSRF exposed | Security risk | ✅ Yes |
| Performance degradation | Page load > 10s, interaction > 1s | App unusable | ✅ Yes |
| Accessibility regression | Critical accessibility violations broken | Compliance violation | ✅ Yes |
| Data loss | User data corrupted or lost (not applicable for v1.0) | Data loss | ✅ Yes |

### 2.2 Issues Requiring Hotfix (Not Rollback)

| Issue | Definition | Impact | Action Required |
|-------|-----------|--------|-----------------|
| Minor UI bug | Spacing, colors, alignment issues | Minor UX issue | Hotfix in 4 hours |
| Browser-specific issue | Works on Chrome, fails on Safari | Partial functionality | Hotfix in 4 hours |
| Mobile-specific issue | Works on desktop, fails on mobile | Partial functionality | Hotfix in 4 hours |
| Edge case bug | Rare condition causes error | Minor impact | Hotfix in 24 hours |
| Performance regression | Page load > 5s (not critical) | Degraded experience | Hotfix in 4 hours |

### 2.3 Rollback Decision Tree

```
Deployment Complete?
    │
    ├─→ NO: Build failed or deployment stuck
    │       │
    │       └─→ Rollback to previous deployment
    │
    ├─→ YES: App loads
    │       │
    │       ├─→ Critical bug detected?
    │       │       │
    │       │       ├─→ YES: Rollback to previous deployment
    │       │       │
    │       │       └─→ NO: Continue monitoring
    │       │
    │       └─→ Minor issue detected?
    │               │
    │               ├─→ YES: Hotfix (don't rollback)
    │               │
    │               └─→ NO: Deployment successful
```

---

## 3. Rollback Procedures

### 3.1 Vercel One-Click Rollback

**When to Use**: Immediate rollback needed, < 5 minutes downtime acceptable

**Steps**:
1. Login to Vercel dashboard
2. Navigate to True Valence Mapper project
3. Go to "Deployments" tab
4. Click "..." menu on failed deployment
5. Select "Rollback"
6. Select previous deployment to rollback to
7. Confirm rollback
8. Verify rollback successful (app loads)

**Time to Rollback**: < 5 minutes

**Impact**: Users see brief downtime (2-5 minutes) during rollback

### 3.2 Manual Rollback via Git

**When to Use**: Vercel rollback fails, need specific version

**Steps**:
1. Checkout previous deployment tag:
   ```bash
   git checkout v0.9.0  # Previous version
   ```
2. Push to main:
   ```bash
   git push origin main --force
   ```
3. Vercel auto-deploys
4. Verify deployment successful

**Time to Rollback**: 5-10 minutes (includes build time)

**Impact**: Users see brief downtime (5-10 minutes) during build and deployment

### 3.3 DNS Rollback (Last Resort)

**When to Use**: Vercel and Git rollback failed, need to redirect to old version

**Steps**:
1. Login to DNS provider (Namecheap, GoDaddy, etc.)
2. Edit DNS record for domain
3. Point CNAME to previous deployment URL (e.g., `old-trust-map.vercel.app`)
4. Save DNS changes
5. Wait for DNS propagation (5-15 minutes)
6. Verify app loads from old URL

**Time to Rollback**: 15-30 minutes

**Impact**: Users see longer downtime (15-30 minutes), potential cache issues

**Note**: Last resort, only use if Vercel and Git rollback fail.

---

## 4. Hotfix Process

### 4.1 When to Hotfix (Not Rollback)

**Criteria**:
- Issue is non-critical (not P0)
- Rollback would lose improvements
- Issue can be fixed quickly (< 1 hour)
- Temporary workaround exists

**Examples**:
- Minor UI bug (spacing, colors)
- Browser-specific issue (works on Chrome, fails on Safari)
- Mobile-specific issue (works on desktop, fails on mobile)
- Edge case bug (rare condition causes error)

### 4.2 Hotfix Workflow

**Phase 1: Identify and Triage** (15 minutes)
1. Bug reported (user feedback, QA, monitoring)
2. Assign severity (P1 high, P2 medium, P3 low)
3. Assign owner (Claude, Codex, or Gemini)
4. Create issue in GitHub with template

**Phase 2: Implement Fix** (30 minutes)
1. Owner implements fix
2. Write test for bug (if not already exists)
3. Verify fix works locally
4. Commit to hotfix branch

**Phase 3: Review and Test** (15 minutes)
1. Peer review of fix
2. Run all tests (unit, integration, E2E)
3. Manual testing of fix
4. Create PR from hotfix branch to main

**Phase 4: Deploy** (15 minutes)
1. Merge PR to main
2. Vercel auto-deploys
3. Verify deployment successful
4. Monitor for regressions

**Total Time**: < 1 hour for P1 issues

### 4.3 Hotfix Branch Naming

**Format**: `hotfix/v1.0.1-description`

**Examples**:
- `hotfix/v1.0.1-fix-safari-pdf-export`
- `hotfix/v1.0.1-fix-mobile-spacing`
- `hotfix/v1.0.1-fix-edge-case-validation`

**Version Bump**:
- Patch version: `v1.0.0` → `v1.0.1` (bug fix)
- Minor version: `v1.0.0` → `v1.1.0` (new feature, backwards compatible)
- Major version: `v1.0.0` → `v2.0.0` (breaking change)

---

## 5. Communication Plan

### 5.1 Pre-Deployment Notification

**Who**: Development team
**When**: 10 minutes before deployment
**Channel**: Email, Slack (if available)

**Template**:
```
Subject: Deploying True Valence Mapper v1.0 to production

Hi team,

We're deploying True Valence Mapper v1.0 to production in 10 minutes.

Preview URL: https://trust-map-preview.vercel.app
Expected downtime: 0 minutes (no downtime for static deployments)
Rollback plan: One-click Vercel rollback if critical issues

Deployment window: 2026-02-17 16:50 - 17:00 EST

Thanks,
The Team
```

### 5.2 Post-Deployment Success Notification

**Who**: Development team, stakeholders
**When**: Immediately after successful deployment
**Channel**: Email, Slack (if available)

**Template**:
```
Subject: True Valence Mapper v1.0 deployed successfully

Hi team,

True Valence Mapper v1.0 has been deployed to production.

Production URL: https://trust-mapper.truevalence.com
Preview URL: https://trust-map-preview.vercel.app
Deployment tag: v1.0.0
Deployed at: 2026-02-17 16:55 EST

All tests passing:
- Unit tests: ✓
- Integration tests: ✓
- E2E tests: ✓
- Lighthouse scores: Performance 95, Accessibility 98, Best Practices 92
- Accessibility audit: Zero critical errors
- Cross-browser: ✓ (Chrome, Edge, Safari, Firefox)
- Mobile: ✓ (iOS Safari, Chrome Android)

No issues detected.

Next steps:
- Monitor for user feedback
- Schedule 5 coaching sessions for real-world testing
- Collect qualitative feedback for v1.1 planning

Thanks,
The Team
```

### 5.3 Rollback Notification

**Who**: Development team, stakeholders, users (if downtime > 5 minutes)
**When**: Immediately after rollback decision
**Channel**: Email, Slack (if available), Twitter/X (if available)

**Template**:
```
Subject: True Valence Mapper v1.0 rolled back

Hi team,

True Valence Mapper v1.0 has been rolled back to previous version.

Reason: [Insert reason, e.g., PDF export failing, app not loading]
Rollback time: 2026-02-17 17:05 EST
Downtime: 5 minutes
Current version: v0.9.0 (previous deployment)

Production URL: https://trust-mapper.truevalence.com

Next steps:
- Investigate issue
- Implement hotfix
- Redeploy when fixed

We apologize for the inconvenience.

Thanks,
The Team
```

**Note**: Only notify users if downtime > 5 minutes. Short rollbacks (< 5 minutes) don't require user notification.

### 5.4 Hotfix Notification

**Who**: Development team, stakeholders
**When**: After hotfix deployment
**Channel**: Email, Slack (if available)

**Template**:
```
Subject: True Valence Mapper v1.0.1 hotfix deployed

Hi team,

A hotfix has been deployed to fix [insert issue].

Hotfix version: v1.0.1
Deployed at: 2026-02-17 18:30 EST
Issue fixed: [Insert issue, e.g., PDF export failing on Safari]

Production URL: https://trust-mapper.truevalence.com

Tests passing:
- All unit tests: ✓
- All integration tests: ✓
- All E2E tests: ✓
- Manual testing: ✓

No regressions detected.

Thanks,
The Team
```

---

## 6. Monitoring and Detection

### 6.1 Post-Deployment Monitoring

**First 15 Minutes**:
- Monitor Vercel deployment logs for errors
- Monitor build logs for warnings
- Manually test complete session flow
- Monitor Lighthouse scores

**First 1 Hour**:
- Monitor for bug reports (user feedback, GitHub Issues)
- Monitor Vercel logs for increased errors
- Monitor performance metrics (if available)

**First 24 Hours**:
- Monitor for bug reports
- Monitor user feedback
- Collect qualitative data from first 5 coaching sessions

### 6.2 Error Monitoring

**Vercel Logs**:
- Login to Vercel dashboard
- Navigate to project
- Go to "Logs" tab
- Filter by: `error`, `warning`, `exception`
- Review logs for patterns

**Browser Console Errors**:
- Open production app in Chrome
- Open DevTools → Console
- Look for red errors
- Note error messages and stack traces

**User Feedback**:
- Monitor email for bug reports
- Monitor GitHub Issues
- Monitor social media (if available)

### 6.3 Performance Monitoring

**Lighthouse CI** (optional for v1.0):
- Run Lighthouse CI on production URL
- Compare scores to pre-deployment scores
- Alert if scores drop > 10 points

**Manual Performance Check**:
- Page load time: Refresh page, measure time to load
- Interaction latency: Add relationship, measure response time
- PDF export time: Export PDF, measure time

---

## 7. Post-Mortem Process

### 7.1 When to Conduct Post-Mortem

**Trigger Events**:
- Deployment rollback required
- Hotfix required (P1 issue)
- Critical bug discovered post-deployment
- Performance regression > 50%
- Accessibility regression detected

**Timeframe**: Within 24 hours of issue resolution

### 7.2 Post-Mortem Template

```markdown
# Post-Mortem: [Issue Title]

**Date**: YYYY-MM-DD
**Duration**: [Start time] - [End time]
**Severity**: P0/P1/P2/P3
**Participants**: [List participants]

## Summary
[Brief description of what happened]

## Timeline
- [Time]: [Event]
- [Time]: [Event]
- [Time]: [Event]

## Impact
- Users affected: [Number]
- Downtime: [Duration]
- Data loss: [Yes/No]
- Severity: [P0/P1/P2/P3]

## Root Cause
[What was the root cause?]

## Contributing Factors
[What factors contributed to the issue?]

## Resolution
[How was the issue resolved?]

## Lessons Learned
[What did we learn?]

## Action Items
- [ ] [Action item 1] - Owner - Due date
- [ ] [Action item 2] - Owner - Due date
- [ ] [Action item 3] - Owner - Due date

## Prevention
[How can we prevent this in the future?]
```

### 7.3 Post-Mortem Best Practices

**Blameless**:
- Focus on process, not individuals
- Ask "what happened" not "who did this"

**Transparent**:
- Share post-mortem with team
- Share learnings (remove sensitive info)

**Actionable**:
- Clear action items with owners and due dates
- Follow up on action items

---

## 8. Rollback Decision Matrix

### 8.1 Decision Checklist

Before rolling back, confirm:
- [ ] Issue is critical (P0)
- [ ] Issue blocks core functionality
- [ ] Issue affects all users (not edge case)
- [ ] Issue cannot be fixed quickly (< 1 hour)
- [ ] Rollback is appropriate (not making things worse)

Before hotfixing (not rolling back), confirm:
- [ ] Issue is non-critical (P1, P2, or P3)
- [ ] Issue affects subset of users (not all)
- [ ] Issue can be fixed quickly (< 1 hour)
- [ ] Temporary workaround exists
- [ ] Rolling back would lose improvements

### 8.2 Decision Flow

```
Issue Detected
    │
    ├─→ Severity P0 (Critical)?
    │       │
    │       ├─→ Yes → Rollback immediately
    │       │
    │       └─→ No → Continue
    │
    ├─→ Can fix in < 1 hour?
    │       │
    │       ├─→ Yes → Hotfix
    │       │
    │       └─→ No → Continue
    │
    ├─→ Temporary workaround exists?
    │       │
    │       ├─→ Yes → Hotfix + Communicate workaround
    │       │
    │       └─→ No → Continue
    │
    └─→ Rollback or Hotfix?
            │
            ├─→ Rollback would lose improvements?
            │       │
            │       ├─→ Yes → Hotfix
            │       │
            │       └─→ No → Rollback
```

---

## 9. Rollback Testing

### 9.1 Rollback Testing Procedure

**Before Rollback**:
1. Verify previous deployment exists
2. Verify previous deployment tag exists
3. Verify previous deployment works (test on preview)

**After Rollback**:
1. Verify app loads at production URL
2. Test complete session flow
3. Verify PDF export works
4. Verify no console errors
5. Notify team: Rollback successful

### 9.2 Rollback Verification Checklist

- [ ] App loads at production URL
- [ ] Landing page works
- [ ] Complete session flow works
- [ ] PDF export works
- [ ] No console errors
- [ ] Lighthouse scores acceptable
- [ ] No critical bugs detected
- [ ] Team notified

---

## 10. Rollback Plan Summary

### 10.1 Key Points

**Immediate Rollback (< 5 minutes)**:
- Vercel one-click rollback
- Use for P0 critical issues

**Manual Rollback (5-10 minutes)**:
- Git checkout previous version
- Push to main
- Vercel auto-deploys

**Hotfix (< 1 hour)**:
- Create hotfix branch
- Implement fix
- Deploy hotfix

**Communication**:
- Pre-deployment notification (10 min before)
- Post-deployment success notification (immediate)
- Rollback notification (if > 5 min downtime)
- Hotfix notification (after hotfix)

### 10.2 Contact Information

**Primary Contact**:
- Name: [Insert name]
- Email: [Insert email]
- Phone: [Insert phone]

**Secondary Contact**:
- Name: [Insert name]
- Email: [Insert email]
- Phone: [Insert phone]

**Vercel Support**:
- https://vercel.com/support

---

## 11. Rollback Plan Appendix

### 11.1 Rollback Command Reference

**Vercel CLI Rollback**:
```bash
# List deployments
vercel ls

# Rollback to previous deployment
vercel rollback <deployment-url>

# Rollback to specific deployment
vercel rollback <deployment-url> --to <deployment-id>
```

**Git Rollback**:
```bash
# List tags
git tag

# Checkout previous tag
git checkout v0.9.0

# Force push to main (rollback)
git push origin main --force
```

**Vercel Dashboard Rollback**:
1. Login to https://vercel.com/dashboard
2. Navigate to project
3. Go to "Deployments" tab
4. Click "..." on current deployment
5. Select "Rollback"
6. Select previous deployment

### 11.2 Rollback Scenarios

| Scenario | Rollback Method | Time | Impact |
|----------|----------------|------|--------|
| App doesn't load (404/500) | Vercel one-click | < 5 min | 2-5 min downtime |
| PDF export broken | Vercel one-click | < 5 min | 2-5 min downtime |
| Security vulnerability | Git rollback | 5-10 min | 5-10 min downtime |
| Performance regression | Git rollback | 5-10 min | 5-10 min downtime |
| Vercel rollback failed | DNS rollback | 15-30 min | 15-30 min downtime |

---

**Rollback Plan Status**: Complete
**Dependencies**: Implementation Plan, Architecture Diagram, QA Strategy
**Next Steps**: All 17 artifacts complete. Ready for Phase 1 (Setup) of development.
