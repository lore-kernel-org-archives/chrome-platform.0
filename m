Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DDA2F25
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 09:57:11 +0000 (UTC)
Received: by mail-pf1-f202.google.com with SMTP id d5-20020a623605000000b004e01ccd08abso1512923pfa.10
        for <chrome-platform@lists.linux.dev>; Wed, 09 Feb 2022 01:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=oNJQZssLDjAyJAxF6wo9msuWG7nPcNfs0eT+bC54JX0=;
        b=SYHiXK5VZWFQ5aTmeuS6T1gjj8GdHLN2sM8akst8i7WARlZC5hMyqc0louLlHUc0zr
         uaWjVBYdnFFAoQLyT5pXpq8Lsp7HbRkmTzcIy+2R7XMOe11Md/oSJ8Lv59eWgoQYJi/j
         kaICLQLOes45/MyUygf1BAGMuYxBrQr2rniKp0NAvrG+0n3qiouH+qSWpz+xyWSf8nCC
         E040j1XjHUqnRSysHOA+lVhWt0TVrJd5iKdMTYkjwTbuXqdrqQdXTneXM65aK9CJfoax
         iOTVBUyvpI/Yb348nIDAgdHm26FwZtnSNfqqtAOZwedCOAhIh4zgqVIZ74VBGfRiMqCh
         75dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=oNJQZssLDjAyJAxF6wo9msuWG7nPcNfs0eT+bC54JX0=;
        b=7V8RawEitzUxvtp/JoJ+4z4HH3NJ0WmCV8X2N8cMpL4+uq0dmIO3LaM+ki7Trt4p6w
         5lHUvI75BFS34MJHdbUtBYID2w5vBW0cbVtzduycpEH2NmFVI6agBRKjBec4y2zyMBSl
         Y670RAAF2IXyOC/EJQpzdjq2rYVbMclerSd4V7cqBJ2nTPRb2my8fpt0D55I1ix1gjTp
         /hE8eow0Xm6q57S8mFpFNNBkDrZTPfThO9IQ5kpr3O9iEPy9mQpP/a76Q3NGSlw6mgXR
         P/StU0l9d9BUyAhq6K2s1rknoXANAtkSnml9KIZ+AGEcuFPH69vEoPDz0zHZDiZqeQs8
         yGTw==
X-Gm-Message-State: AOAM531CdH7aShQV7670tQx+B2qtpNP8ZBFWi2OHhRNUo7TiRbhmoBst
	7No8CsmeHCPyuyGKMljCPCwplmSNujEy
X-Google-Smtp-Source: ABdhPJyPRn5IdzEiW1gUW9KKQnPzdEVpt+JsGSIo5QZwt61C4xhzLUyNNqjI0BTN9OJc6y82IlMqoMVc+F+a
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:ee29:8b32:75bc:44ec])
 (user=tzungbi job=sendgmr) by 2002:a17:902:b089:: with SMTP id
 p9mr1316045plr.93.1644400630994; Wed, 09 Feb 2022 01:57:10 -0800 (PST)
Date: Wed,  9 Feb 2022 17:56:57 +0800
Message-Id: <20220209095703.517608-1-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH v3 0/6] platform/chrome: cros_ec: miscellaneous cleanups
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com, pmalani@chromium.org
Content-Type: text/plain; charset="UTF-8"

The 1st patch fixes unhandled undos in error handling path.

The rest of patches cleans drivers/platform/chrome/cros_ec.c.

Changes from v2:
(https://patchwork.kernel.org/project/chrome-platform/cover/20220209045035.380615-1-tzungbi@google.com/)
- Fix review comments in 1st and 2nd patch.

Changes from v1:
(https://lore.kernel.org/lkml/20220125101527.1812887-1-tzungbi@google.com/T/#u)
- Use imperative mood in commit messages.
- Use IS_ERR_OR_NULL() in 1st patch.

Tzung-Bi Shih (6):
  platform/chrome: cros_ec: fix error handling in cros_ec_register()
  platform/chrome: cros_ec: remove unused variable `was_wake_device`
  platform/chrome: cros_ec: determine `wake_enabled` in
    cros_ec_suspend()
  platform/chrome: cros_ec: don't initialize `err` in cros_ec_register()
  platform/chrome: cros_ec: sort header inclusion alphabetically
  platform/chrome: cros_ec: append newline to all logs

 drivers/platform/chrome/cros_ec.c           | 37 +++++++++++----------
 include/linux/platform_data/cros_ec_proto.h |  3 --
 2 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.35.0.263.gb82422642f-goog

