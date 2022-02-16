Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D466923AC
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 08:03:19 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id x1-20020a25a001000000b0061c64ee0196so2713292ybh.9
        for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 00:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Aj1+/jvhiBhQfXtmmF+ZYOOgdJDt/Hruc8PhsRcVwMY=;
        b=tY3DJSychOnSosHGJuYNVv6K/mGEB6lprRwn4sq/yn5KyYvZ6gOqFdtrG+Z4sS9eKf
         dXHWLvte9O6XJ8EBuML4TIE5wVWHQj22Q+aSFK8YAd/Cq+SUQBWSqL++i9DV0ziScRDs
         05c4WnMRtyZXppZw3+W03FFd8J73MNMSOQCO6OdKGS4cCj8rguhemCfCdFNqb+Ay3lAD
         wPE5GAqgyOqx3EJ+QN4vSzu+khLqtvMTLY2oPl79Srmh89sJravucyzUbm+2clYEFqfx
         yv6HqrgXe962bTLtY/aFlf1XDxnKWgqJpW5DLHHLQGMsknwr6iLSQUAYmiFCSk8z+xDU
         Cn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Aj1+/jvhiBhQfXtmmF+ZYOOgdJDt/Hruc8PhsRcVwMY=;
        b=KIKDsJ41nddVQab1n4144rn1727jyAsAgSPrmWEzhRuO6uGI0Aet9hw8qQt0+wj5Kv
         hV6N+tcnWXB5yHELIrdkbSX9phimTz/mZJCSRQGuNTWt88DugjP0lkQaSmiFYyeLcFp0
         HIj+CyhSjJiIlxTxbrUpzhgjiZplXL3e64PTtQWhGHrahnUcGZ3ksXYGzvxWomFe7dy8
         6rA6UvkfXW4BQ3UsOCthVG9isPGsP6m4fs6J/tZ/l84HHDhdxUijoQ/ZbgMUj8xXsURv
         ZJZws0JVT7IrgoGdzuSBPK8mmgipWNZCoyMwrlt++jH7MjRTG2h2WNSfO+lJrOwTXqGx
         PgfQ==
X-Gm-Message-State: AOAM533hPlzp6Lke5LitH2Fez25VJ4O4mq3YW5J/0v4UewHyeH3Qke8N
	XWnUSFmKSzGjRGmsZoRU2SPmprOEFOOs
X-Google-Smtp-Source: ABdhPJz+Bg5yo4/Ca6COUQ6m7qreuAPv5o5yIDK3crQbt3NO/hYBuNfsGQF3FW64XTflf/HlITUqanJi+XSA
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:8ce7:5b2:9787:1a0b])
 (user=tzungbi job=sendgmr) by 2002:a25:ef47:0:b0:622:7be6:7a0 with SMTP id
 w7-20020a25ef47000000b006227be607a0mr1166508ybm.191.1644998598777; Wed, 16
 Feb 2022 00:03:18 -0800 (PST)
Date: Wed, 16 Feb 2022 16:03:01 +0800
Message-Id: <20220216080306.3864163-1-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [PATCH v5 0/5] platform/chrome: cros_ec: miscellaneous cleanups
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, pmalani@chromium.org, tzungbi@google.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The 1st patch fixes unhandled undos in error handling path.

The rest of patches cleans drivers/platform/chrome/cros_ec.c.

Changes from v4:
(https://patchwork.kernel.org/project/chrome-platform/cover/20220216043639.3839185-1-tzungbi@google.com/)
- Rollback the 3rd patch to older version.

Changes from v3:
(https://patchwork.kernel.org/project/chrome-platform/cover/20220209095703.517608-1-tzungbi@google.com/)
- Drop "platform/chrome: cros_ec: don't initialize `err` in cros_ec_register()".
- Rename the 3rd patch's title.

Changes from v2:
(https://patchwork.kernel.org/project/chrome-platform/cover/20220209045035.380615-1-tzungbi@google.com/)
- Fix review comments in 1st and 2nd patch.

Changes from v1:
(https://lore.kernel.org/lkml/20220125101527.1812887-1-tzungbi@google.com/T/#u)
- Use imperative mood in commit messages.
- Use IS_ERR_OR_NULL() in 1st patch.

Tzung-Bi Shih (5):
  platform/chrome: cros_ec: fix error handling in cros_ec_register()
  platform/chrome: cros_ec: remove unused variable `was_wake_device`
  platform/chrome: cros_ec: determine `wake_enabled` in
    cros_ec_suspend()
  platform/chrome: cros_ec: sort header inclusion alphabetically
  platform/chrome: cros_ec: append newline to all logs

 drivers/platform/chrome/cros_ec.c           | 36 ++++++++++++---------
 include/linux/platform_data/cros_ec_proto.h |  3 --
 2 files changed, 20 insertions(+), 19 deletions(-)

-- 
2.35.1.265.g69c8d7142f-goog

