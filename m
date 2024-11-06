Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE341DB546
	for <chrome-platform@lists.linux.dev>; Wed,  6 Nov 2024 09:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730885655; cv=none; b=YHOBgDtIRM+uk+13sHhR3C+HVjUK6UAsBJ1RBc6WonFa7r3ZC2atfe/DKpf7HdoiZu9QOWcL7AVO1Ps1l4qSY/QaWcWSfv8PAtMetFkjoKSH9xP6eKlulZtZ55cX65QfTDB+tml07lEK/4M1em9OI9r3Mgrs4+DHE23+zn41lqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730885655; c=relaxed/simple;
	bh=F5ArjWom+MQi62Ghn0rbbhm+sqeF3wwa6gc09F6PrqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gcLML7N1CJvhRpbkgy39ySYlgys8H2poSX6gC7wPw709DIYLej3Czj/HEDum5GLZUpb8rJIlZ3b3IWzg0S6I/yUeWmN3ck06xRXfZ0OxlSkYObEO2wywydyAtACPnfLCe0vKs8Oh7WP0Zzq5PSnVMv2SoHe2BjMCkIrmKf4VTiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XIMjsiaG; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XIMjsiaG"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20c9978a221so65978265ad.1
        for <chrome-platform@lists.linux.dev>; Wed, 06 Nov 2024 01:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730885652; x=1731490452; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbfB757zoogv3EY5nGOvTyWU1LRL3RJGksVkmiyRShA=;
        b=XIMjsiaGs7WzzXNp1V8qtlaaYwynjafyfYEDaOyhKFLVOdPaxoy62+WyWMy7ecd3MD
         cZ7yAutUxheRki3JL8llpSlq9d64blUQN3A48d/+9xrgEE3EQQvaZpj4/55RX4/pDVI6
         MlHOQWOAPLfRsfB6HEHzrT5G0BhpGr3p9wut0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730885652; x=1731490452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbfB757zoogv3EY5nGOvTyWU1LRL3RJGksVkmiyRShA=;
        b=XXx8W3Ax32QYlzCfpS16V3AUGYdKz8Hp1PHzQxeY/og7NGa+/UxFSET8X6v3DX3G/b
         cSU81Iplee1KBs3lkSSOZrhX6I23RpuVBVjGiVQEJe5/Kr6aSPTzvPWox9YFhk5xmaNM
         /fPQxOpc7+60uY+Oumg6+dZ92UIs1TSazqe+hYKNdsaRB9vydpwYEN5/ophkMfGiYCYp
         QPN6+LSrVQxnkHtOF7jDeZF55DGMWKEoLa8VxTuh++PkUpg2ZW/WgVUNsB7NN8eQrHiQ
         pHmZJKt4QAL0+d0aIWxKFToUEF2onjBYlOh9lio91LX2MJWshyVyNoKbWrn76ceg928n
         EmJg==
X-Forwarded-Encrypted: i=1; AJvYcCWmU4ilXxSwJ0fnUN3pkit91Id4aii1TCry2uVp29e53syEgrFtYUiF+JDQlxuMExIrWr8znmThWdc+RdHvIQA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMbzmjSW3avUl/laOJO4M4z52C9Xi6xTCmiLQzrZqLgoozaaWU
	P9+3pdgVaBTFcXac8RfYgkaOSdCzJjVa/XbOkcpQJMleM+l2mbgvjEfMkio/jw==
X-Google-Smtp-Source: AGHT+IGsqJnP2c29fT7ec18QitUEURWR4HKremiykkNa1vQPN87ztDDGEmp/BT6g/9KjaXSGkYd/CA==
X-Received: by 2002:a17:903:234c:b0:20c:5b80:930f with SMTP id d9443c01a7336-210c68a9c02mr560445915ad.12.1730885652382;
        Wed, 06 Nov 2024 01:34:12 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:93fe:1d68:b50:3213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057062b8sm91478665ad.63.2024.11.06.01.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:34:12 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH v11 2/7] of: base: Add for_each_child_of_node_with_prefix()
Date: Wed,  6 Nov 2024 17:33:29 +0800
Message-ID: <20241106093335.1582205-3-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
In-Reply-To: <20241106093335.1582205-1-wenst@chromium.org>
References: <20241106093335.1582205-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are cases where drivers would go through child device nodes and
operate on only the ones whose node name starts with a given prefix.

Provide a helper for these users. This will mainly be used in a
subsequent patch that implements a hardware component prober for I2C
busses.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v7:
- Collected Rob's Reviewed-by
Changes since v6:
- Changed helper name to "for_each_child_of_node_with_prefix()"
Changes since v5:
- New patch
---
 drivers/of/base.c  | 35 +++++++++++++++++++++++++++++++++++
 include/linux/of.h |  9 +++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d94efee4a7fc..a01e5534c2fd 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -628,6 +628,41 @@ struct device_node *of_get_next_child(const struct device_node *node,
 }
 EXPORT_SYMBOL(of_get_next_child);
 
+/**
+ * of_get_next_child_with_prefix - Find the next child node with prefix
+ * @node:	parent node
+ * @prev:	previous child of the parent node, or NULL to get first
+ *
+ * This function is like of_get_next_child(), except that it automatically
+ * skips any nodes whose name doesn't have the given prefix.
+ *
+ * Return: A node pointer with refcount incremented, use
+ * of_node_put() on it when done.
+ */
+struct device_node *of_get_next_child_with_prefix(const struct device_node *node,
+						  struct device_node *prev,
+						  const char *prefix)
+{
+	struct device_node *next;
+	unsigned long flags;
+
+	if (!node)
+		return NULL;
+
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	next = prev ? prev->sibling : node->child;
+	for (; next; next = next->sibling) {
+		if (!of_node_name_prefix(next, prefix))
+			continue;
+		if (of_node_get(next))
+			break;
+	}
+	of_node_put(prev);
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+	return next;
+}
+EXPORT_SYMBOL(of_get_next_child_with_prefix);
+
 static struct device_node *of_get_next_status_child(const struct device_node *node,
 						    struct device_node *prev,
 						    bool (*checker)(const struct device_node *))
diff --git a/include/linux/of.h b/include/linux/of.h
index d0307e3b093d..f921786cb8ac 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -289,6 +289,9 @@ extern struct device_node *of_get_parent(const struct device_node *node);
 extern struct device_node *of_get_next_parent(struct device_node *node);
 extern struct device_node *of_get_next_child(const struct device_node *node,
 					     struct device_node *prev);
+extern struct device_node *of_get_next_child_with_prefix(const struct device_node *node,
+							 struct device_node *prev,
+							 const char *prefix);
 extern struct device_node *of_get_next_available_child(
 	const struct device_node *node, struct device_node *prev);
 extern struct device_node *of_get_next_reserved_child(
@@ -1468,6 +1471,12 @@ static inline int of_property_read_s32(const struct device_node *np,
 	     child != NULL;						\
 	     child = of_get_next_child(parent, child))
 
+#define for_each_child_of_node_with_prefix(parent, child, prefix)	\
+	for (struct device_node *child __free(device_node) =		\
+	     of_get_next_child_with_prefix(parent, NULL, prefix);	\
+	     child != NULL;						\
+	     child = of_get_next_child_with_prefix(parent, child, prefix))
+
 #define for_each_available_child_of_node(parent, child) \
 	for (child = of_get_next_available_child(parent, NULL); child != NULL; \
 	     child = of_get_next_available_child(parent, child))
-- 
2.47.0.199.ga7371fff76-goog

