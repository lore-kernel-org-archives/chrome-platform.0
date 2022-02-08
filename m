Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA932F2E
	for <chrome-platform@lists.linux.dev>; Tue,  8 Feb 2022 03:13:27 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id a88-20020a25a1e1000000b00615c588ab22so32871768ybi.3
        for <chrome-platform@lists.linux.dev>; Mon, 07 Feb 2022 19:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=AIZ/knnwAKeb/BKuZaLULYu/UPf7imccggwpo1VmmoU=;
        b=LRooLhjfDEzbuItD6IuJxZtuFd26gy99kjvMR6fLnHJe5dJr66zdonhVpSyoBXoFG1
         zfRPUxZGwOw25mdUxklh9s+EUPyUDJ75Vb1CdWTLTZsfU7GK05kBLH7MPuPoC1ujna/H
         FIitNTZshopGp7U/Oj54x9chdeILa5PJg0gUpzn8CoiKew8B7Mzol01sLojS7LmXT6ui
         Il68t5PWrfcrMRGy6256bhpt8HKmW/K2K+Kt+t3xIzXn1QOIlJYjYaGFV5CiPk17YXB2
         KE00qodHkjqzfvEBOOTU6m1WsHdRd+anCIUXIYsYb9ztIoUhI07zvNkuYKqkBMiID1uY
         5Hqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=AIZ/knnwAKeb/BKuZaLULYu/UPf7imccggwpo1VmmoU=;
        b=40pnForHL6fHQ0VB6jAGtcHvXcjmsMplFaMBXnrzTxHt6eMkms9xJxiDrloMOuzDDP
         4C/GIT4mk/6+larXcZokybQkQCo880bacstjAt7qiKZgqbT9HTAz2PM5v09dwxOf2+DA
         we0QJWwBk2gWpZTSPxkrhhCNe/zREHZsicdp0FfrPpD58LL05WqX2FjoXHAisWein4Ru
         5m+l3SUfwwYPoRGSW0wQE5P7A5a8HF2Zbu4P0CHo8qvUbuGMaY5QsRS15e9ZHm1qokcF
         +QInYaykWmZLm0Z8Xy3G3dpRDHKlXPLUQfV+0N9yaFPwGhUay8cJlGcN5Me8ZUhx8pCG
         6ozQ==
X-Gm-Message-State: AOAM5306rdXy3B8gUh69MIN5z8wDxyD96VjvzihcjjDOA25QeAkUCyfw
	UnIYJFuuOPhFR+7K+9QbtU4acOCfolel
X-Google-Smtp-Source: ABdhPJzzFjsZhO0447mYnQrzEUxP6u2E7S74KuYeOZ8nSpGEuuSAJs0p+hEcd5fdvF05cSubltgQWz3J3tIV
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:d041:828a:7048:cfc9])
 (user=tzungbi job=sendgmr) by 2002:a81:a781:: with SMTP id
 e123mr3110938ywh.63.1644290005913; Mon, 07 Feb 2022 19:13:25 -0800 (PST)
Date: Tue,  8 Feb 2022 11:12:42 +0800
Message-Id: <20220208031242.227563-1-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH] MAINTAINERS: update cros_ec_codec maintainers
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, cychiang@chromium.org, bleung@chromium.org
Cc: alsa-devel@alsa-project.org, tzungbi@google.com, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Updates cros_ec_codec maintainers.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../devicetree/bindings/sound/google,cros-ec-codec.yaml          | 1 +
 MAINTAINERS                                                      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
index 77adbebed824..c3e9f3485449 100644
--- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
@@ -8,6 +8,7 @@ title: Audio codec controlled by ChromeOS EC
 
 maintainers:
   - Cheng-Yi Chiang <cychiang@chromium.org>
+  - Tzung-Bi Shih <tzungbi@google.com>
 
 description: |
   Google's ChromeOS EC codec is a digital mic codec provided by the
diff --git a/MAINTAINERS b/MAINTAINERS
index 568152aa9973..a1f4fd15e770 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4573,6 +4573,7 @@ F:	drivers/platform/chrome/
 
 CHROMEOS EC CODEC DRIVER
 M:	Cheng-Yi Chiang <cychiang@chromium.org>
+M:	Tzung-Bi Shih <tzungbi@google.com>
 R:	Guenter Roeck <groeck@chromium.org>
 L:	chrome-platform@lists.linux.dev
 S:	Maintained
-- 
2.35.0.263.gb82422642f-goog

