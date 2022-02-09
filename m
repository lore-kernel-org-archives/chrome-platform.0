Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7EC2C80
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 09:57:28 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id m10-20020a25800a000000b0061daa5b7151so3746804ybk.10
        for <chrome-platform@lists.linux.dev>; Wed, 09 Feb 2022 01:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=UG8PyS/piTDySpDY4q3V93iNg/uO6gwtySeAVQxms8k=;
        b=IrAGrVtvCsMtqSg/rifKwcIZ2qU1d9/AHiDqeuqNmWswM71DEi93XIvx6xMWubzp4w
         4U+ngljDHe+XbLAudzX0z4hGwc40IEWYvQn1V0yRNp8OdLAxE0TzKRA2giVWr5X5ZL0E
         RdLAYNHTkfvHHyPfnDJqb5UmduK52LlK9Hk3IGkVJwcwrI/oCJrJm6JGDFBhQ03ENg+0
         3B+IyYQ8yZGD7fCjYFAZenKCrRJN5jQjUtfAT3iQZfaUP6LvmVR6zR8vd9nXGqZbw0+F
         Pqr4rHDYEiQi6TcUDWLO5MYQWPFqZ4LXm0kGCD7PdVIn42wrBBCiGs5WZy8io7aoQ7Iy
         erFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=UG8PyS/piTDySpDY4q3V93iNg/uO6gwtySeAVQxms8k=;
        b=ta5xbB4bErNM5DbOdw4c+tTfZH7MDxjyBhPbF1TCtFghzn6iNW3OUEPd23ZNC0tKJs
         5/nVhMiY1MjQXIVr9A5aHb59zMq68rjf0NRLA+oIYf1lsRY1Y2jKMGSXSGFkjX3YkSQe
         cOfXga2XHnZVwSNXxXGk8Tt2VujBXBebYTEnoRp41qyWJrgU9lzfuHfqld7jk0Bm3x9V
         wL+SEzJ+FjfzNOMnULKMswSnJNHjJIJfmMCCsnAPfY6j2YTiMCiQRmvEQjWfJkKjZddy
         diFayzPniS70Kk8VRpxmAUCEByI1+oWDnXPEgGrX4D1EQZbgFNGVz3uMcRa+7DQBOHi0
         tlFg==
X-Gm-Message-State: AOAM532RI5MYqGaRUT8fORPDRA5Y9YQvTqU5K9dxKkE16ZjPVUc+UtiK
	JGVrRQ8wGpUcCKfbF3dvfdqSHJvCWv/z
X-Google-Smtp-Source: ABdhPJxKIPk0HOfbFn+yj4lQxP+A+O64P/7oH7REOAF8c7v2FZkEXoE6WqpyXgSs17Jz9nCibYjhzQKvduQp
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:ee29:8b32:75bc:44ec])
 (user=tzungbi job=sendgmr) by 2002:a25:c753:: with SMTP id
 w80mr1331685ybe.381.1644400647153; Wed, 09 Feb 2022 01:57:27 -0800 (PST)
Date: Wed,  9 Feb 2022 17:57:01 +0800
In-Reply-To: <20220209095703.517608-1-tzungbi@google.com>
Message-Id: <20220209095703.517608-5-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220209095703.517608-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH v3 4/6] platform/chrome: cros_ec: don't initialize `err` in cros_ec_register()
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com, pmalani@chromium.org
Content-Type: text/plain; charset="UTF-8"

`err` in cros_ec_register() doesn't need to be initialized because it is going
to be overridden in the following code soon.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
No changes from v2.

Changes from v1:
(https://lore.kernel.org/lkml/20220125101527.1812887-1-tzungbi@google.com/T/#u)
- Use imperative mood in commit message.

 drivers/platform/chrome/cros_ec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 07dd5cc35d7c..618b8b4c42ef 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -182,7 +182,7 @@ static int cros_ec_ready_event(struct notifier_block *nb,
 int cros_ec_register(struct cros_ec_device *ec_dev)
 {
 	struct device *dev = ec_dev->dev;
-	int err = 0;
+	int err;
 
 	BLOCKING_INIT_NOTIFIER_HEAD(&ec_dev->event_notifier);
 
-- 
2.35.0.263.gb82422642f-goog

