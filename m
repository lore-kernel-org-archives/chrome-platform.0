Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E43B676
	for <chrome-platform@lists.linux.dev>; Thu, 21 Sep 2023 14:19:40 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-5784671b7ebso763747a12.1
        for <chrome-platform@lists.linux.dev>; Thu, 21 Sep 2023 07:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695305980; x=1695910780; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cis3oX7GTvjLlkeSC+gMrCtuuhgE+PLGFmnmHQVroFE=;
        b=MBbx1wPCqOHVI9YDj8R35AEKrzxqglmTgEfO/6zsqnuWhAfQB/+m6s3Bcp0GyRGBg/
         CRx/yiI/igzdEedE7El6mZ0rreo0LSlv8Wt9LLyFAzypoFpZnLcl7ZcoGJaTIM+7BHz5
         Tt/8DWVcxM7i3M6d565LOmHj/8NTzXxwRr17IGxqGF510Q2JfpkMhMi8qDNq6q0rnwnu
         l91Bi/w2O504JlkVnu41zEhpHlDqXVZNIwwMYU/4MAXqqrgKjLft52jxxO1saQs/VTm/
         1+8lXCJJhYCpsRyHXXyN2ZILexz7y2xHNWFFos7M21mHpYspWd91uPOIaCYDgr14QJ6D
         xCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695305980; x=1695910780;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cis3oX7GTvjLlkeSC+gMrCtuuhgE+PLGFmnmHQVroFE=;
        b=O71CMSI8Op6aEoqikIO6LSd63GlxNhT8OIZ4mINUBbbmhqv9IxYxbJ4fUgpSfxWzE/
         crbw/wE7uNTgRiYk/oLxetB5m0Qhp0V5ThJw6hOfgZGKMNIHciO7B3WJCFPrTx6aVKNG
         x2L3M2ld+4w5fIm8Ktd1RQOIHTwH4UEO/rLlUX5woGzbwdZ2NSTL5VEunQnZBKsTr5N8
         FHNYLpQ/Jb3HPdZw0Y9ROK0zTPTfc7O9fk+vUdL9XEMbmz1dMxMkgNBKjdhtPBriNLAB
         RCgK4S6Fv313S+NAXgzl1//NhIzrCyIhvDhcx8rNEhRM5qTEZfHq/hMeQBlF2MHQkDyw
         fMvw==
X-Gm-Message-State: AOJu0YyBMMB1gwqeRDl/6x5kGQbLwEJm7wn6dWy/FofMJ0YMdpQjgGIX
	QqXr+ssI3xDEBmSonOd8eJ0IHrsl+Gr2BHtoSKrutk54Wwk9m1BBHR8RIZBbypGrv+3SeXVjh3+
	e72JymtiYmB/chq96TBOemJpd1/xNGVXOnwYZOTfVu7okVAf74u8ffYfP8bTPTgj20EFAxFRQEf
	sqguSO3w==
X-Google-Smtp-Source: AGHT+IHTrIvLu6I6untAfpppJqSdXwu6v+jWjwKYl1zrovZlzl0VEC5dNbGK6/W1FkHJGhAPQICobS8JzS+/BAs=
X-Received: from robbarnes3.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6451])
 (user=robbarnes job=sendgmr) by 2002:a63:8f12:0:b0:578:c1ab:9c63 with SMTP id
 n18-20020a638f12000000b00578c1ab9c63mr75522pgd.1.1695305979762; Thu, 21 Sep
 2023 07:19:39 -0700 (PDT)
Date: Thu, 21 Sep 2023 14:19:35 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230921141935.3973069-1-robbarnes@google.com>
Subject: [PATCH] drivers/cros_ec: Reduce log polling period to 2s
From: Rob Barnes <robbarnes@google.com>
To: chrome-platform@lists.linux.dev
Cc: gwendal@chromium.org, groweck@chromium.org, 
	Rob Barnes <robbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"

Lowering the log polling interval to 2 seconds provides two advantages:
1. Minimizes the risk of EC internal log buffer overfilling and truncating.
2. Yields more recent logs prior to a crash, facilitating easier debugging.

Signed-off-by: Rob Barnes <robbarnes@google.com>
---
 drivers/platform/chrome/cros_ec_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
index 9044c6bab770c..c96493504127d 100644
--- a/drivers/platform/chrome/cros_ec_debugfs.c
+++ b/drivers/platform/chrome/cros_ec_debugfs.c
@@ -21,7 +21,7 @@
 
 #define LOG_SHIFT		14
 #define LOG_SIZE		(1 << LOG_SHIFT)
-#define LOG_POLL_SEC		10
+#define LOG_POLL_SEC		2
 
 #define CIRC_ADD(idx, size, value)	(((idx) + (value)) & ((size) - 1))
 
-- 
2.42.0.459.ge4e396fd5e-goog

