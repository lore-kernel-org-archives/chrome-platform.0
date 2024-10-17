Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46021D9663
	for <chrome-platform@lists.linux.dev>; Thu, 17 Oct 2024 09:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729158161; cv=none; b=HdK0+Bz6jnPDnD/+icQQtR/HxI+i+Jvyftu7drizDbaYuHongbOvf+0+qrX75Li2BKS0B9Y2QTjHWcyRy8s0RrCbsZg1/5H3mpNap8mzt5Rpp9iG2N45Oi5UnPt50WY4RsFUj9y0mbJ6zhz1340YSZ8JdwtOF3P125Wf9TVLEME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729158161; c=relaxed/simple;
	bh=MId2xZZ81OybQFetgSsAykDpdl2QlAv0Pb4xxKayODU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UEEp/ZWTmrVnmWd+Aijp5aZCXzGMgT8KsXKqBdXoPtbIJOI8sWJqg5FQpgfl2nRRFm2nBGe9WMMnhyRAr9Xf1RujsBOL2XIciRj+AMV0xp+g6UMjUIyHXgFaxHBL4JZd3mywH4z/Dw//Oesf8wImOMG1eHaOfSmJJA2IUiWkMlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F5OYs7dl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F5OYs7dl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20c714cd9c8so7641815ad.0
        for <chrome-platform@lists.linux.dev>; Thu, 17 Oct 2024 02:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729158158; x=1729762958; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HUfOP8BsCvd1B7O/Bwqytp/NnRsOmtEcRv5sfFy0Ao=;
        b=F5OYs7dl12D/GoVRU+CQRYVIrT2Xlyn/g9PJhA2cjcaWzPLq9l08/UcXifOe8W0suK
         vhpt7CEEZ1b7tJLDHFODyup9mMN1JriXNdx0CFE/v8YuEHq5j9Psh452DMTbKIGKzNYu
         U+eU76b7lUBoH/Mlqsv8jdb/Qk/bYpOPDWnik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729158158; x=1729762958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HUfOP8BsCvd1B7O/Bwqytp/NnRsOmtEcRv5sfFy0Ao=;
        b=qEbfPMCz9Ql8m/pQrhU/g+KQiJwcWMOzKcBiV1ViImWIyo5ZOqqBe0HNpwnN8iEUWJ
         rNS03a8kgLRL2St5fRAZY48kIHsuZEIY5myVaXfucWexWuCqN3Bu2Sz5VVFZ0Zc7HFTl
         GRNpkbSoB9KCE7rFokPD7w3+g6ZVhQc5cAfusIJvcZjMZLKPEU5n1K0ZQ76uetoyEHu2
         vm2v3GPhcHWEcSc0VfwLNz3fGNbi8YQmqRMjEA3XuKwXHjKZux/wmNKyaroIZZpw4Ey9
         XiMDfZi1QBm11U83VOz1p1hUwFW1cIUMma537tQrj0mpISFOg7ftRrNtvOZZmMvQ/8ik
         zJSA==
X-Forwarded-Encrypted: i=1; AJvYcCUo8IkpYjHJeXzv36W6zRDP5TVZcxcAUzZG4snTxoTygkAFiWKaU1zgEpRLWoYzVsVAfm1E24QP+Z6edg0Mneg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbJmi4WFe/Hs1nCN/fb55er3io94neExOuXwKsZfQmnwMmGKVD
	pJTRusQeV0J6cB3CUDnAdf3Kg4nnZkZm5JDFp2Ut1dFR+jCWJicwi8agh5Sepg==
X-Google-Smtp-Source: AGHT+IHT4+zzl9R0Ike3MBwqQu0knSbe1bnofAe1pyh+O5dYhcMwxGAJD4ZqoWUDWmjDxZxoCRdzlw==
X-Received: by 2002:a17:902:e84b:b0:20b:6f04:486a with SMTP id d9443c01a7336-20cbb1b931fmr278393475ad.35.1729158158169;
        Thu, 17 Oct 2024 02:42:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fabb:a7ab:3d7:9aaa])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f87ccasm40638655ad.62.2024.10.17.02.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 02:42:37 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v9 2/7] of: base: Add for_each_child_of_node_with_prefix()
Date: Thu, 17 Oct 2024 17:34:37 +0800
Message-ID: <20241017094222.1014936-3-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
In-Reply-To: <20241017094222.1014936-1-wenst@chromium.org>
References: <20241017094222.1014936-1-wenst@chromium.org>
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
2.47.0.rc1.288.g06298d1525-goog

