Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76134E36FF
	for <chrome-platform@lists.linux.dev>; Thu, 17 Sep 2026 20:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789677739; cv=none; b=AZ3qCExA2tW4HOaMOlj7Qt2gaJFikIWVKpFPl80LlGqUMpsQHMvVHA1xAuvIxasl9kt96sNoiN6cx3GV5v1a9Zh5jNNJl8o1YXJBbOsrX8ik54jsvSSgluKY7Z18s7lFcpsRAGfH+SZhPMo/TpFuThYWHH40+yK+FhHcZIk82Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789677739; c=relaxed/simple;
	bh=kZtK+sVq+OakP0n9604KZpM7r41BPS7WKoDg0NZh8xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oWgDuzadIEkRo7TzM+gCEoTqRDgQe1o2ISZC/VqBygyiCdVrZ0g/5LdGe+LePHp//LdfSkZHK172L69MaPPwV1T+871FqFUHHF7Zoc4HqQ4+4a9n5FLX1hr1vX2uxulGx5UyNSFuIHI3hRW9/7sgNMlXK3bS7AaArkxUTzAYDsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKJSewIj; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKJSewIj"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-52fa9c055b5so12986321cf.1
        for <chrome-platform@lists.linux.dev>; Thu, 17 Sep 2026 13:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789677737; x=1790282537; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=38H1xf2/ET/SoNjoIYflqfRDEtEJGG8vw0YM1GLHy9Q=;
        b=bKJSewIjfwkncLyFsdiUrxPAwy3O4rCtRK3BihigPiB8nMbAz7nYKNpwpvTVbZ8R+X
         YxChr43BrUme0ro+BbkvsmaOp5JHpOkLgLiPfaN1LpLH4abNKBznHwFfYMx4UmDbrjB0
         vGpQE3mNaDIgVW5gY470oSo0SL0uX0eGppkxbqgWyDv7cRsBED9wdHO9tq5t+3xU/2pY
         Q7UNBKdFaMwMLU/nHsx5dqs3VaYRq/jpeegbjjHj+qJG+Fe7ld0hhx7czF0+TLtM74kq
         kffCCPL5Z3a6M8Rb2hIJrO3xcMAQx+weu5BnMKjpRMhIFvykxW1bctV1Kw+EdPLqIYXJ
         S5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789677737; x=1790282537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=38H1xf2/ET/SoNjoIYflqfRDEtEJGG8vw0YM1GLHy9Q=;
        b=pPesHO9wF460NlgDiCCzqnBsGYyIOEDOJ6m10wROroqzqeblWCGI8De/xSM9tA550B
         Ka/5i5m9rGIPjpaVBX3siiWcDD4SFM37xu3UWxYKpAuME0kQn70YwkbQQ8AR+4X0JOSF
         Wy83a8gA+Phxe+7s33CHc3cRtl5fSQcCSs+4PyaAqPIJ8dikZ7cq7i6WihdC8D4jlCL+
         a4NUjFDbZEzN75azICRHYRyO1x6mun33BNOU8N0619IcRBrh6+LI4tCw8Mnb7yppnN2R
         88y55wDBb/sg7WVPl9ydfrzd6iacpvuBLQTWIzoQPhJ8hI1BECHTKw8UNkmc72gkWbqg
         XxRg==
X-Forwarded-Encrypted: i=1; AKwUvByubM3UY83w23kBBu/5usa02QSzwdmiHuyDmhRJBt8c9O+tJJ2aApsg2UhFsVGs4yJy4cwsaNlR90Jmf1j49yU=@lists.linux.dev
X-Gm-Message-State: AFuF++nbUasTGzvHwQW5yhNXA/1iCzJAEKqQFnzmtytxa62oOjLxBbVW
	rTMOJFe6FUj9J8cjU0fxjIWajo31TsCkBPNRYTJ2WibgCu2JTwkZVr0=
X-Gm-Gg: AYBFou2GBIKhJ8SlBqBd9fDdaSODA2qYp9+QngmYMrw4gTk7xNB7ks56SOIplIIjf5n
	dQrk7QpntpFWlFHn7u/CMBtGGjptFKmUl4PC78h0EM5ZBQi2Hxrn4OKkw1A+ecvhWnqQstV8qfX
	ZJJcrMYgsFNohiW8juPd37wOlEdNtl09DUa5qU4MlmxwElPw8H/3pimAdA9LArhvdnZ7S0c+vAo
	fmYaT2f8Ry+9+2Xx/34RobW+RgfTMpkBIz+PWldfjCkOkRmfg3oF3KQLPdhqabzckhe3wADbHBY
	oPr0RoPDAMT7uBfjFDY/+mGKtqdbxxnAISk2evKxdcL7mcv0vopCEe1Kuq6oMZyfRxqIZShD3UZ
	hS8CKEpo4K1j3v8DjNH38v1AX7qx1WqEYl1vHL6O5sadXQqnZpNWAwwbfaFyQYj5bLUfxEGmiK0
	PTRRz6Myq9kh/v6tcxIxUryqOxRmtg2dQVD8031scx+Ri+KhH85TPlVwhAHVtHhsXFg7cS3i0IT
	4j/gBkxJoixy0csUjwwA08JMQKa36/ZWel/hKeOok195MSnuTLGDKOTq1XwH6lu4sVzogH1Xkcm
	SxnRjprKLxalaT6wv9rC6DvP2iBieZUxAofh
X-Received: by 2002:ac8:5ace:0:b0:532:8063:4ccc with SMTP id d75a77b69052e-5328cedfe9dmr79101391cf.3.1789677736834;
        Thu, 17 Sep 2026 13:42:16 -0700 (PDT)
Received: from localhost.localdomain ([104.39.169.225])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5326204ad36sm58764301cf.18.2026.09.17.13.42.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 13:42:15 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] platform/chrome: cros_ec_typec: Stop altmode work before unregistering ports
Date: Thu, 17 Sep 2026 16:42:09 -0400
Message-ID: <20260917204209.97699-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DisplayPort and Thunderbolt port altmodes queue work to deliver VDM
responses to their partners. Port teardown only cancels port_work and
then unregisters the partner and port altmodes, leaving the separate
altmode work able to access released altmode data.

Disable and drain each port altmode's work before unregistering the
partner altmodes. Disabling also prevents a partner callback from
requeueing the work while its driver is being removed. Use the common
port teardown path so probe error handling is covered as well.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: dbb3fc0ffa95 ("platform/chrome: cros_ec_typec: Displayport support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Validated with static source review, apply checks and strict checkpatch.
No build or runtime testing was performed.

 drivers/platform/chrome/cros_ec_typec.c      |  1 +
 drivers/platform/chrome/cros_typec_altmode.c | 15 +++++++++++++++
 drivers/platform/chrome/cros_typec_altmode.h |  6 ++++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 50a68819ceb7bbfbd888ca919d678d4c75237c26..e91bbc219c077067294935dd5602c1aec636cfa6 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -378,6 +378,7 @@ static void cros_unregister_ports(struct cros_typec_data *typec)
 		if (!typec->ports[i])
 			continue;
 
+		cros_typec_altmodes_stop(typec->ports[i]);
 		cros_typec_remove_partner(typec, i);
 		cros_typec_remove_cable(typec, i);
 
diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
index 66c546bf89b532d3bae1de322a1cfb1205e0190f..2492058d98b8ef2a4a1a9bee87ce0574f4f0a736 100644
--- a/drivers/platform/chrome/cros_typec_altmode.c
+++ b/drivers/platform/chrome/cros_typec_altmode.c
@@ -37,6 +37,21 @@ struct cros_typec_dp_data {
 	bool pending_status_update;
 };
 
+void cros_typec_altmodes_stop(struct cros_typec_port *port)
+{
+	struct cros_typec_altmode_data *adata;
+	int i;
+
+	for (i = 0; i < CROS_EC_ALTMODE_MAX; i++) {
+		if (!port->port_altmode[i])
+			continue;
+
+		adata = typec_altmode_get_drvdata(port->port_altmode[i]);
+		if (adata)
+			disable_work_sync(&adata->work);
+	}
+}
+
 static void cros_typec_altmode_work(struct work_struct *work)
 {
 	struct cros_typec_altmode_data *data =
diff --git a/drivers/platform/chrome/cros_typec_altmode.h b/drivers/platform/chrome/cros_typec_altmode.h
index 3f2aa95d065af709643ad653df487a9987780da4..9e67f82ba031d67dfbe3a0549a7987386c33d120 100644
--- a/drivers/platform/chrome/cros_typec_altmode.h
+++ b/drivers/platform/chrome/cros_typec_altmode.h
@@ -11,6 +11,12 @@ struct typec_altmode;
 struct typec_altmode_desc;
 struct typec_displayport_data;
 
+#if IS_ENABLED(CONFIG_CROS_EC_TYPEC_ALTMODES)
+void cros_typec_altmodes_stop(struct cros_typec_port *port);
+#else
+static inline void cros_typec_altmodes_stop(struct cros_typec_port *port) {}
+#endif
+
 #if IS_ENABLED(CONFIG_TYPEC_DP_ALTMODE)
 struct typec_altmode *
 cros_typec_register_displayport(struct cros_typec_port *port,
-- 
2.47.1
