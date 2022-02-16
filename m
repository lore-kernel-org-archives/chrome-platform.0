Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869B31FA8
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 04:36:51 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id t18-20020a63dd12000000b00342725203b5so581429pgg.16
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 20:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=JgRTlFw8++kyf5ZSG/NEY0qnd4+2DMvg2lXX0xsMQJI=;
        b=VG2vcH/tSu2S3ORYoluC8fi+F9edyN/vKsOjZx3LCLD6vaDPIfMq5ziR5ni6kEZADU
         T92YVumGy29n+opxo8wtrWzxX3ACAo26qUDE0ISQffyaFtl4AO5KkjwNZetm3H9dsOeN
         KfRA1KMhyn6ek9jVfuns3icvtU48qSCBBiqZ+59/539bA2w4O4+fwEjQW/3KTE5Vv61C
         kc73NWY1WxnWU2B51rNCAvpLqt8kbdgmGcmfhLfMBJqUyUVw0VGY/k6CwVkYXLfOd4Ul
         2HolZa0jVrRri93aZs2bnWL3aArfG5NuOY7wBUOkP9xapZgRnmpZYM2qAoWyysMBwoZH
         EGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=JgRTlFw8++kyf5ZSG/NEY0qnd4+2DMvg2lXX0xsMQJI=;
        b=Xu8AMsMDQZWkceZuv7MKfxS5SqaPLCpWOnlEZLSKeU4d8C1A1oEiNTE30Hf+ODWDkD
         qOYCclM0aKLrG28YGr5MXJtJj4TxtjJT/XTPzN4aImKh1ft/H/WOqwMcoFBuUvXXuefm
         deFp5S50oXFGAfnFRjRrA5CeQ/MpmrZ+Ydug3M2NkB/4FoLjDKPTJSkHg5lJEBR1f713
         JJsBnqrKHbDF4+0MESRt03m0fBUYZZh9nf9KfQ82RPYr4/BdhvZXN1Or7cFIpMaUYCDI
         qAtIfZ0g2ebfQoTLEHPtrMxduyxH8NASyki0uVu2gvhJ97PZUQbKgYkzcl5AusOZNoAT
         9kxA==
X-Gm-Message-State: AOAM530Cu7PETjbPtyIRCW4GFl1GU5mvkNmppDA+uP5brMSnctXxXX+B
	cNCTAcPS40IuYYV/Q+47Ls9+OYamT3oP
X-Google-Smtp-Source: ABdhPJz6LOCv+7yHmcbOHyo1VZ93g2kOY12xH4CJ8jvUN6udfQDKwsKCW10DMS1iwib22RM6hx+Sa2W/HBLt
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:8ce7:5b2:9787:1a0b])
 (user=tzungbi job=sendgmr) by 2002:a62:8c44:0:b0:4c4:8072:e588 with SMTP id
 m65-20020a628c44000000b004c48072e588mr1244438pfd.11.1644986210942; Tue, 15
 Feb 2022 20:36:50 -0800 (PST)
Date: Wed, 16 Feb 2022 12:36:34 +0800
Message-Id: <20220216043639.3839185-1-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [PATCH v4 0/5] platform/chrome: cros_ec: miscellaneous cleanups
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com, pmalani@chromium.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The 1st patch fixes unhandled undos in error handling path.

The rest of patches cleans drivers/platform/chrome/cros_ec.c.

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
  platform/chrome: cros_ec: initialize `wake_enabled` in
    cros_ec_register()
  platform/chrome: cros_ec: sort header inclusion alphabetically
  platform/chrome: cros_ec: append newline to all logs

 drivers/platform/chrome/cros_ec.c           | 35 +++++++++++----------
 include/linux/platform_data/cros_ec_proto.h |  3 --
 2 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.35.1.265.g69c8d7142f-goog

