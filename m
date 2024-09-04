Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B65188A03
	for <chrome-platform@lists.linux.dev>; Wed,  4 Sep 2024 09:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725440443; cv=none; b=FITKqeORkJPhI1YZthbpAwdCXngLUSHU7rJRC87vgMwFO/bwU/KtahpBEt3UVwgSw7RbRFggPSIuIDxoXQXKoKBCd5HEe1dVEbsAhX5qApkLHqIY+y9AL90fAVC3JL0wWEvmRqjJklXnzIwl7i3oxa++kWHHrSlhauR3FMUY6e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725440443; c=relaxed/simple;
	bh=RE4UXi7l9eMgJ3wfNPpPt3WrWoJ5g+lHg0xdah3ZsJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=msTNnNgGFRTtAGLedsOk210x4bfYgAfYQjpUJb/Ou8g5sgSiEZYcvrNa+qvBA2F5n4iytJM41AJGkKxOMuXNePELcbBoxb60T2uZbddAW01DxtuV3sp7b/3Pg9eF50DiQtS9+WTII09PHyZ2uRtHOxWrOyBzRYVoHZHiOkO/gWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RbUEZU8y; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RbUEZU8y"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71456acebe8so490206b3a.3
        for <chrome-platform@lists.linux.dev>; Wed, 04 Sep 2024 02:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725440441; x=1726045241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqurBuTzBG79QZ78UIum29OxfBzXy96OhjTo0P9FefQ=;
        b=RbUEZU8y0x9/rDyaFpgh1JV/YFXGnV07MXUdLNNFrszsB5LI43uuulS6UPN22r7be1
         so2zqMv/32TS4Bx4AZ8JECM5GcrJXxFFRjpSWulRooYWBuG7RnlkRtV3ocGvJexNnT6k
         oo8+BsPowfzoSjpwU+VelRD5CGV7fjpEtw0PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725440441; x=1726045241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqurBuTzBG79QZ78UIum29OxfBzXy96OhjTo0P9FefQ=;
        b=MRindOYfW2P5SXwUxgg+CeW72kZ9eOBVfYM9U1tG0Fyw9JpUW0uVy9KjWRXsxC6uCz
         GsAxs7VkD6EU/VTIzXy3A/RyX1qNWVy9iD09eUr3SQCkQ5mGT+jjgSq0bW2jKeDyj2YJ
         sCJaRgjKGuqnINl2BkBSRGF8qCeeGgKJMdB3PKPfVvek5edjb6aoZ/yqwMvHtJq9s1Gp
         ZrLmj2u1tLk7DITAVx4pe2jSkPPppCZylOH/Y3abSeCECI4UKCWjvz7TUb98ECK5pPPZ
         PCgzTqLT6tigxlx1b+KIPPab6M6Kkj9bPYg+NPW8JvxJ4XXOmknecRTBy2fxZ7MTgjAS
         1btg==
X-Forwarded-Encrypted: i=1; AJvYcCVOXrhMhkogKXYripdaFa2Mr4A2RPPTOSGpTgd9UElg4jgSDuI/m947apwFULpAb7w3zfpnRvs7niD/z9NQUgM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHhCgzNIH/Y0XMH3s9oh0wgYK5x7nhwbDsZZgdBFhm291uq/Xn
	U79zvxAfqpBV70grq9W6O+/fSomngsQxe9l/TV/Tn+y3YGTgl0bqMYpGr4hiUQ==
X-Google-Smtp-Source: AGHT+IHe1ov6SAHeqdTpaMdmXEE49/kdY3WIDfrYRS2QYo2M/zJW5BO+zQ6dWos4RcZpLJnxA2k6Yg==
X-Received: by 2002:a05:6a00:3d11:b0:714:20d1:944e with SMTP id d2e1a72fcca58-715dfaeaea3mr22059815b3a.2.1725440441161;
        Wed, 04 Sep 2024 02:00:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:83fc:5c8e:13bd:d165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717785b5183sm1153279b3a.197.2024.09.04.02.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 02:00:40 -0700 (PDT)
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
Subject: [PATCH v6 05/12] regulator: Do pure DT regulator lookup in of_regulator_bulk_get_all()
Date: Wed,  4 Sep 2024 17:00:07 +0800
Message-ID: <20240904090016.2841572-6-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904090016.2841572-1-wenst@chromium.org>
References: <20240904090016.2841572-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The to-be-introduced I2C component prober needs to enable regulator
supplies (and toggle GPIO pins) for the various components it intends
to probe. To support this, a new "pure DT lookup" method for getting
regulator supplies is needed, since the device normally requesting
the supply won't get created until after the component is probed to
be available.

Convert the existing of_regulator_bulk_get_all() for this purpose.
This function has no in-tree users, as the original patch [1] that
used it was never landed. This patch changes the function ABI, but
it is straightforward to convert users.

The underlying code that supports the existing regulator_get*()
functions has been reworked in previous patches to support this
specific case. An internal OF-specific version of regulator_get(),
of_regulator_get_optional(), is added for this.

Also convert an existing usage of "dev && dev->of_node" to
"dev_of_node(dev)".

[1] https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec@gmail.com/

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Used "dev_of_node(dev)" instead of "dev->of_node"
- Replaced "dev_printk" with "dev_printk()" in kerneldoc mentions
- Fixed kerneldoc "Return" section format for of_regulator_get_optional()
- Fix @np parameter name in of_regulator_dev_lookup() kerneldoc

Changes since v4:
- Restore platform-agnostic regulator consumer code to original state
- Move OF-specific regulator code to of_regulator.c (separate patch)
- Split _regulator_get() into three parts for reuse (separate patch)
- Add OF-specific _of_regulator_get() function
- Rename regulator_of_get_optional() to of_regulator_get_optional() for
  consistency
- Make of_regulator_get_optional static, as it is only used internally
- Convert of_regulator_bulk_get_all()

Changes since v3:
- New patch
---
 drivers/regulator/core.c         |  4 +--
 drivers/regulator/internal.h     |  2 ++
 drivers/regulator/of_regulator.c | 52 +++++++++++++++++++++++++++-----
 3 files changed, 49 insertions(+), 9 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index d60c86477ac2..f94a06ac2109 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1959,8 +1959,8 @@ static struct regulator_dev *regulator_dev_lookup(struct device *dev,
 	regulator_supply_alias(&dev, &supply);
 
 	/* first do a dt based lookup */
-	if (dev && dev->of_node) {
-		r = of_regulator_dev_lookup(dev, supply);
+	if (dev_of_node(dev)) {
+		r = of_regulator_dev_lookup(dev, dev_of_node(dev), supply);
 		if (!IS_ERR(r))
 			return r;
 		if (PTR_ERR(r) == -EPROBE_DEFER)
diff --git a/drivers/regulator/internal.h b/drivers/regulator/internal.h
index 5b43f802468d..f62cacbbc729 100644
--- a/drivers/regulator/internal.h
+++ b/drivers/regulator/internal.h
@@ -67,6 +67,7 @@ static inline struct regulator_dev *dev_to_rdev(struct device *dev)
 
 #ifdef CONFIG_OF
 struct regulator_dev *of_regulator_dev_lookup(struct device *dev,
+					      struct device_node *np,
 					      const char *supply);
 struct regulator_init_data *regulator_of_get_init_data(struct device *dev,
 			         const struct regulator_desc *desc,
@@ -82,6 +83,7 @@ bool of_check_coupling_data(struct regulator_dev *rdev);
 
 #else
 static inline struct regulator_dev *of_regulator_dev_lookup(struct device *dev,
+							    struct device_node *np,
 							    const char *supply)
 {
 	return ERR_PTR(-ENODEV);
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index d5dd7a9e577b..b00172176d0c 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -590,7 +590,8 @@ static struct device_node *of_get_child_regulator(struct device_node *parent,
 
 /**
  * of_get_regulator - get a regulator device node based on supply name
- * @dev: Device pointer for the consumer (of regulator) device
+ * @dev: Device pointer for dev_printk() messages
+ * @node: Device node pointer for supply property lookup
  * @supply: regulator supply name
  *
  * Extract the regulator device node corresponding to the supply name.
@@ -598,15 +599,16 @@ static struct device_node *of_get_child_regulator(struct device_node *parent,
  * Return: Pointer to the &struct device_node corresponding to the regulator
  *	   if found, or %NULL if not found.
  */
-static struct device_node *of_get_regulator(struct device *dev, const char *supply)
+static struct device_node *of_get_regulator(struct device *dev, struct device_node *node,
+					    const char *supply)
 {
 	struct device_node *regnode = NULL;
 	char prop_name[64]; /* 64 is max size of property name */
 
-	dev_dbg(dev, "Looking up %s-supply from device tree\n", supply);
+	dev_dbg(dev, "Looking up %s-supply from device node %pOF\n", supply, node);
 
 	snprintf(prop_name, 64, "%s-supply", supply);
-	regnode = of_parse_phandle(dev->of_node, prop_name, 0);
+	regnode = of_parse_phandle(node, prop_name, 0);
 
 	if (!regnode) {
 		regnode = of_get_child_regulator(dev->of_node, prop_name);
@@ -632,6 +634,7 @@ static struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
 /**
  * of_regulator_dev_lookup - lookup a regulator device with device tree only
  * @dev: Device pointer for regulator supply lookup.
+ * @np: Device node pointer for regulator supply lookup.
  * @supply: Supply name or regulator ID.
  *
  * Return: Pointer to the &struct regulator_dev on success, or ERR_PTR()
@@ -646,13 +649,13 @@ static struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
  * * -%ENODEV if lookup fails permanently.
  * * -%EPROBE_DEFER if lookup could succeed in the future.
  */
-struct regulator_dev *of_regulator_dev_lookup(struct device *dev,
+struct regulator_dev *of_regulator_dev_lookup(struct device *dev, struct device_node *np,
 					      const char *supply)
 {
 	struct regulator_dev *r;
 	struct device_node *node;
 
-	node = of_get_regulator(dev, supply);
+	node = of_get_regulator(dev, np, supply);
 	if (node) {
 		r = of_find_regulator_by_node(node);
 		of_node_put(node);
@@ -669,6 +672,41 @@ struct regulator_dev *of_regulator_dev_lookup(struct device *dev,
 	return ERR_PTR(-ENODEV);
 }
 
+static struct regulator *_of_regulator_get(struct device *dev, struct device_node *node,
+					   const char *id, enum regulator_get_type get_type)
+{
+	struct regulator_dev *r;
+	int ret;
+
+	ret = _regulator_get_common_check(dev, id, get_type);
+	if (ret)
+		return ERR_PTR(ret);
+
+	r = of_regulator_dev_lookup(dev, node, id);
+	return _regulator_get_common(r, dev, id, get_type);
+}
+
+/**
+ * of_regulator_get_optional - get optional regulator via device tree lookup
+ * @dev: device used for dev_printk() messages
+ * @node: device node for regulator "consumer"
+ * @id: Supply name
+ *
+ * Return: pointer to struct regulator corresponding to the regulator producer,
+ *	   or PTR_ERR() encoded error number.
+ *
+ * This is intended for use by consumers that want to get a regulator
+ * supply directly from a device node, and can and want to deal with
+ * absence of such supplies. This will _not_ consider supply aliases.
+ * See regulator_dev_lookup().
+ */
+static struct regulator *of_regulator_get_optional(struct device *dev,
+						   struct device_node *node,
+						   const char *id)
+{
+	return _of_regulator_get(NULL, node, id, OPTIONAL_GET);
+}
+
 /*
  * Returns number of regulators coupled with rdev.
  */
@@ -886,7 +924,7 @@ int of_regulator_bulk_get_all(struct device *dev, struct device_node *np,
 		} else {
 			memcpy(name, prop->name, i);
 			name[i] = '\0';
-			tmp = regulator_get(dev, name);
+			tmp = of_regulator_get_optional(dev, np, name);
 			if (IS_ERR(tmp)) {
 				ret = PTR_ERR(tmp);
 				goto error;
-- 
2.46.0.469.g59c65b2a67-goog

