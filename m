Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2850913D897
	for <chrome-platform@lists.linux.dev>; Wed, 11 Sep 2024 07:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726039709; cv=none; b=PHxXEYb0nzXJJjeoSsy4wNnIuMGj5dHTQ21i15xJKbnfd6ySwkk8sQgckuTsl9xQxS8oVSwHOKNLs+TqsVV/kRAHQuKnJPjQioa/6eU7irE1///+IywiEkQF8uXQOc3Q78vEw63p+DgeajGy4mGAme8l6JVs2XtLiaXDZrwJE+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726039709; c=relaxed/simple;
	bh=WIfkiNtSKIwyx7GizcoCeKoQku6qSRlQSE16sb4sWRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rogIQw/tzqb5kdnbb6Ra6IqrhOgf+3S3jRg3AexAe2kItRElA5DKwjeBoDcl8dWj1MGOoICNSEvrcduCY8OxcwSSVvY4UneBlWE/GDyu5+5EceOo9kMXKLyg/IGFN66gNTSx4yvDSn7izp1rOsQAll1y9bHgrf6XjfXNl7zFelY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S9XW/MO6; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S9XW/MO6"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71911585ac4so1214289b3a.1
        for <chrome-platform@lists.linux.dev>; Wed, 11 Sep 2024 00:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726039705; x=1726644505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHYuF087WkDWw6t01rd+JoBLqqCohsT20qRvxciVpzs=;
        b=S9XW/MO6G7x6mywPUPZQ03ceUQ4F+1EP26pjXnD/U3AoU0YG99oTNyW2Q84SndbYI6
         hQk7mTY34IZ7gc75HSOT/OrU/w52Oiij7gFC8aCmYHCV2KlKnymRYEyNljbSb1glx2oO
         yWn78bZp3cNML9DR4Y/uDqHXYduU6Cefg+KVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726039705; x=1726644505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHYuF087WkDWw6t01rd+JoBLqqCohsT20qRvxciVpzs=;
        b=GGDiwYH3KGpuRG2DiW613qEtt2Bt4H1qiK2j2Kv2vxlFBVbv9OM2Hts7Zc5U2amfPC
         kXKYK9MqZcYb6gCb8ywN1ITmFLWTf7t4CDfnQWTQSHGKZDlTokxpjiJ/OnrSebs/cXyZ
         m8lDNxbpZV0rvy2xVxZWq9jFNUBcHK+WkE4kM40hPqoXzwQuBEp0IStzb3R+GC81RF1a
         q3YL+mXutcn5r3Qj4qCDqIoAMALOkP8bLglBIIRD/E4le3/rCmfsN0uB7uQKITdTe0SC
         gfD8GhRwHYU1j15JRyve11zAbrKwZH56ZW9BCVCDHoZnsn0twhjynsBM8NRKBBm7QU4e
         miCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhIQqHipE0cXBsoVkdM6t8TgOIP4zmklkKomWZg/dLn5sYTG80eGtmesmRXY6s6TYitmk/eSsNEsIb8M4mpaw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyuQN5N87GYYTQCRsW+TZuKJS6Rxz9IbuDmyH6pbNHql+T5LAh+
	/tFmSQuGhEjmfMb5l32ICY0FinF/ZBHDDH7DCDouOsC9whv6aC2afIvaTga6mA==
X-Google-Smtp-Source: AGHT+IF7NCaFQn5NI21IL8mvEhnYcnrMWrYJBC5MrY8umX2zBuXqZDWtQyZtz6v7uD5SvjxSxtithQ==
X-Received: by 2002:a05:6a20:2d0b:b0:1cf:6dd7:fa50 with SMTP id adf61e73a8af0-1cf6dd7fa7cmr114263637.11.1726039705459;
        Wed, 11 Sep 2024 00:28:25 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8398:fe34:eba2:f301])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe4e7esm2399415b3a.80.2024.09.11.00.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:28:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
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
Subject: [PATCH v7 02/10] of: base: Add for_each_child_of_node_with_prefix()
Date: Wed, 11 Sep 2024 15:27:40 +0800
Message-ID: <20240911072751.365361-3-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911072751.365361-1-wenst@chromium.org>
References: <20240911072751.365361-1-wenst@chromium.org>
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
---
Changes since v6:
- Changed helper name to "for_each_child_of_node_with_prefix()"
Changes since v5:
- New patch
---
 drivers/of/base.c  | 35 +++++++++++++++++++++++++++++++++++
 include/linux/of.h |  9 +++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 20603d3c9931..d3c123b3261a 100644
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
index 046283be1cd3..48cfb39197d6 100644
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
2.46.0.598.g6f2099f65c-goog

