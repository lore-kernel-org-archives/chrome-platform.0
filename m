Received: from mail-oo1-f74.google.com (mail-oo1-f74.google.com [209.85.161.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB472C80
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 04:50:58 +0000 (UTC)
Received: by mail-oo1-f74.google.com with SMTP id c124-20020a4a4f82000000b002fb4087a29fso679448oob.20
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 20:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=RHk25DN0/ZfupdswNUXEUVlZfAqqSfGu21RsrAB7jvs=;
        b=oFs43K4uwJcIV6HaNiwRQyuGq4ivTrIXJGtPq5D3iZpyvEFtXDFtB/d2jFPTnRsQfy
         vG6jkgUL/FVKJlIZMyuBDUJQWTl150msIKzHRUUmc0TlE4r3PQstc/0NrsJNFW8GCRrg
         f/jt1JhEBmGAwvARXf2+yu1X9ffEcefv89AdRepFa1zkd1GigPhL0u9uTyCpm0hlfAYu
         JfPCad1vUGp6vxUAbddjrxyu4QGo0SMW4hzSOVxu0tk48VlEp7erHHAPTP5waC/RJuD0
         lZ6mB3/OBOlwDdfmJMOWrgRg9/mPo40UPzdnftcsGQ+VFAnLGMOsz1mI7vmERxw0MBes
         GeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=RHk25DN0/ZfupdswNUXEUVlZfAqqSfGu21RsrAB7jvs=;
        b=rUsKbJe/+3l/4GCu3z0/gsAMiyqUNVZWhz1fROO8RFeAadLxQKAboMDGLC9f4EtsBk
         Xizakev6AWsKMQ7wO7BY5MNjeKbbrXNd87PkEDlcE3UrIioBNZJ5yFl5Yd9wdOO6SA1W
         Nwv+6Jb5MDWGO0xjfObI8D5zHDW4OHU98g9BMZhoZYsGyol5OFU6daxGLHLBsVn23jxs
         Db9PPsV/Pe2PH/m2udLAPgYq3AeSMM1CzTG2QW9qcJOBx/sX+DMOAxH7CYtfXJ4CVCdO
         oYaHd+X7pSbH7JNSqNUqD94IccSMM0eBnB9EwiwOx5IJGN5M10N5rK1EPnnkNkKS5rjP
         xU6w==
X-Gm-Message-State: AOAM531MqyQMThmxc9WrZu1GTvQfmdOEUIcwrkLcnxrbQwNsvbRWJZ10
	oQJLYbW3jCLmdy6TMhFreDfED/p/nr5K
X-Google-Smtp-Source: ABdhPJz4nczjbNCzYcIv7E3rjuJKjoz6FJjY/rCeWNnx7Ub1qcIS1XluXx7bODLU129gTbfuY1RvgOJmqIeJ
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:4b6f:f14d:be50:86a])
 (user=tzungbi job=sendgmr) by 2002:aca:c008:: with SMTP id
 q8mr215786oif.236.1644382257694; Tue, 08 Feb 2022 20:50:57 -0800 (PST)
Date: Wed,  9 Feb 2022 12:50:33 +0800
In-Reply-To: <20220209045035.380615-1-tzungbi@google.com>
Message-Id: <20220209045035.380615-5-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220209045035.380615-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH v2 4/6] platform/chrome: cros_ec: don't initialize `err` in cros_ec_register()
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"

`err` in cros_ec_register() doesn't need to be initialized.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/platform/chrome/cros_ec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index a97a47ae0472..c2105621b368 100644
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

