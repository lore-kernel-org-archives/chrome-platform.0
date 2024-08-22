Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A3718130D
	for <chrome-platform@lists.linux.dev>; Thu, 22 Aug 2024 09:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724318430; cv=none; b=PIHoLn/0rm/MDZ0/RtDXnle0GmdHvKJR395Th/3b526IB3vhBwrw8tp8+a2W4a2mx1S0D4NRf1lA7UJv8sKirUNCe2BmnoReZiGJvjQOWjUl0SzhezwkeFtW2l7Z7Zeyzfz9d9EbUiwACOtCGceeLGM1NB6F8SmbiNUDsLzcp7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724318430; c=relaxed/simple;
	bh=ELziOpfut8Y9y2QpRYtBASCpGbA0kgK45JJaJ9cGJa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rWDzvuMtL6gkRYeFOxO/7aDrzUaYww8/MGUskSv2xvrX9u7cfLxiu7txUMqES8jDtuG5gCyj5WghvH3gdWVUFlmkWfDVycb+8+tJSTQCX9bxgnp81LeIutHLyUpIjheKFkZ8T/J6DWS+efCHzo1cEkE3ZFIDehql2X/KVS8cFtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G9WYSMtw; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G9WYSMtw"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7142a30e3bdso1051341b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 22 Aug 2024 02:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724318428; x=1724923228; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IeQTJP2FGJKC+q0TaK5nRU8de0bpWdLOhuHTxIn3w+o=;
        b=G9WYSMtwsHbY6iiGG62Twgdej+ec0MlS0d6k2hyRK5wFvxYOlNddIT8sZ44g5W9aCV
         21zGkPZfC2AcKzsP55gE3XaaaK7eXn2B6lzoxAFeG9J1z1qizunZMc8CgrSSyqovJozc
         4IyDSGdS466NSFEd5K5zdhJmCRBWG4bDKWmHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724318428; x=1724923228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IeQTJP2FGJKC+q0TaK5nRU8de0bpWdLOhuHTxIn3w+o=;
        b=ZTQLZFh0nluTwBIXuuFJw+VdcaYw15jd1x6RKQEa9+ERC4Nql9/WxIOJsZkYlcIx8W
         HCgG/Rr1HkATBs04+b3E73YfuhMKaiE9qnxlm3ZCWn6BjEw2Em7hiavvalQiRBiuROuP
         ykmmzW5Y4QFQHPkehXSKHQ9SX4rTAeV3F4mD4fFWhPANBfK7JKoVeGPlsPAMY8ODXhy5
         zH0SX4mII8IFdv4W4jx5CZCaPkEv3jkme+3XyJvROA4qpP6aMvkU68u4QS5tuMTM3Yz5
         /eWzvI0HvZIQpOT9RC7skGT/n3KFwXC/TipP5ZxY/Y56t1J7N9banBWZCYKcNJQmQ+Ax
         L3oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq6MehSk//9V9QZveRYDJC+6d/F08/uuYnXOwTDtHurB0LfaUDknWeg6W/0Ev0hsiqC3rbAMCfByDuw3XGzy8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJfwI94wjMYX08s/pDs4MwgQR/l8SNqItMISYYKoTRIJVV1Kuh
	906YyBg4vpBP/4F9OlKnZ2HNZvoQfS6MBY0aOXQHh3F68trLYSEq7g93jDDDRw==
X-Google-Smtp-Source: AGHT+IH60pf2USyhbGl6hcFS70WibHe7v+VnRzo4raEis9sQGEqleOsBie2zhiyldOuUYRp+I/niuQ==
X-Received: by 2002:a05:6a21:c94:b0:1ca:ccd0:1bdb with SMTP id adf61e73a8af0-1cae524ea12mr3283455637.20.1724318428213;
        Thu, 22 Aug 2024 02:20:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8470:6a67:8877:ce2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434335e69sm951398b3a.194.2024.08.22.02.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:20:27 -0700 (PDT)
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
Subject: [PATCH v5 02/10] regulator: Move OF-specific regulator lookup code to of_regulator.c
Date: Thu, 22 Aug 2024 17:19:55 +0800
Message-ID: <20240822092006.3134096-3-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240822092006.3134096-1-wenst@chromium.org>
References: <20240822092006.3134096-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's still a bit of OF-specific code in the regulator device lookup
function.

Move those bits of code over to of_regulator.c, and create a new
function of_regulator_dev_lookup() to encapsulate the code moved out of
regulator_dev_lookup().

Also mark of_find_regulator_by_node() as static, since there are no
other users in other compile units.

There are no functional changes.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- New patch
---
 drivers/regulator/core.c         |  85 ++------------------------
 drivers/regulator/internal.h     |   9 +--
 drivers/regulator/of_regulator.c | 102 ++++++++++++++++++++++++++++++-
 3 files changed, 111 insertions(+), 85 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 9029de5395ee..361309fcae57 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -419,72 +419,6 @@ static void regulator_lock_dependent(struct regulator_dev *rdev,
 	mutex_unlock(&regulator_list_mutex);
 }
 
-/**
- * of_get_child_regulator - get a child regulator device node
- * based on supply name
- * @parent: Parent device node
- * @prop_name: Combination regulator supply name and "-supply"
- *
- * Traverse all child nodes.
- * Extract the child regulator device node corresponding to the supply name.
- * returns the device node corresponding to the regulator if found, else
- * returns NULL.
- */
-static struct device_node *of_get_child_regulator(struct device_node *parent,
-						  const char *prop_name)
-{
-	struct device_node *regnode = NULL;
-	struct device_node *child = NULL;
-
-	for_each_child_of_node(parent, child) {
-		regnode = of_parse_phandle(child, prop_name, 0);
-
-		if (!regnode) {
-			regnode = of_get_child_regulator(child, prop_name);
-			if (regnode)
-				goto err_node_put;
-		} else {
-			goto err_node_put;
-		}
-	}
-	return NULL;
-
-err_node_put:
-	of_node_put(child);
-	return regnode;
-}
-
-/**
- * of_get_regulator - get a regulator device node based on supply name
- * @dev: Device pointer for the consumer (of regulator) device
- * @supply: regulator supply name
- *
- * Extract the regulator device node corresponding to the supply name.
- * returns the device node corresponding to the regulator if found, else
- * returns NULL.
- */
-static struct device_node *of_get_regulator(struct device *dev, const char *supply)
-{
-	struct device_node *regnode = NULL;
-	char prop_name[64]; /* 64 is max size of property name */
-
-	dev_dbg(dev, "Looking up %s-supply from device tree\n", supply);
-
-	snprintf(prop_name, 64, "%s-supply", supply);
-	regnode = of_parse_phandle(dev->of_node, prop_name, 0);
-
-	if (!regnode) {
-		regnode = of_get_child_regulator(dev->of_node, prop_name);
-		if (regnode)
-			return regnode;
-
-		dev_dbg(dev, "Looking up %s property in node %pOF failed\n",
-				prop_name, dev->of_node);
-		return NULL;
-	}
-	return regnode;
-}
-
 /* Platform voltage constraint check */
 int regulator_check_voltage(struct regulator_dev *rdev,
 			    int *min_uV, int *max_uV)
@@ -2009,7 +1943,6 @@ static struct regulator_dev *regulator_dev_lookup(struct device *dev,
 						  const char *supply)
 {
 	struct regulator_dev *r = NULL;
-	struct device_node *node;
 	struct regulator_map *map;
 	const char *devname = NULL;
 
@@ -2017,19 +1950,11 @@ static struct regulator_dev *regulator_dev_lookup(struct device *dev,
 
 	/* first do a dt based lookup */
 	if (dev && dev->of_node) {
-		node = of_get_regulator(dev, supply);
-		if (node) {
-			r = of_find_regulator_by_node(node);
-			of_node_put(node);
-			if (r)
-				return r;
-
-			/*
-			 * We have a node, but there is no device.
-			 * assume it has not registered yet.
-			 */
-			return ERR_PTR(-EPROBE_DEFER);
-		}
+		r = of_regulator_dev_lookup(dev, supply);
+		if (!IS_ERR(r))
+			return r;
+		if (PTR_ERR(r) == -EPROBE_DEFER)
+			return r;
 	}
 
 	/* if not found, try doing it non-dt way */
diff --git a/drivers/regulator/internal.h b/drivers/regulator/internal.h
index 77a502141089..ffeaef22169e 100644
--- a/drivers/regulator/internal.h
+++ b/drivers/regulator/internal.h
@@ -66,7 +66,8 @@ static inline struct regulator_dev *dev_to_rdev(struct device *dev)
 }
 
 #ifdef CONFIG_OF
-struct regulator_dev *of_find_regulator_by_node(struct device_node *np);
+struct regulator_dev *of_regulator_dev_lookup(struct device *dev,
+					      const char *supply);
 struct regulator_init_data *regulator_of_get_init_data(struct device *dev,
 			         const struct regulator_desc *desc,
 				 struct regulator_config *config,
@@ -80,10 +81,10 @@ int of_get_n_coupled(struct regulator_dev *rdev);
 bool of_check_coupling_data(struct regulator_dev *rdev);
 
 #else
-static inline struct regulator_dev *
-of_find_regulator_by_node(struct device_node *np)
+static inline struct regulator_dev *of_regulator_dev_lookup(struct device *dev,
+							    const char *supply)
 {
-	return NULL;
+	return -ENODEV;
 }
 
 static inline struct regulator_init_data *
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index d557f7b1ec7c..d924f5c1de59 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -550,7 +550,73 @@ struct regulator_init_data *regulator_of_get_init_data(struct device *dev,
 	return NULL;
 }
 
-struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
+/**
+ * of_get_child_regulator - get a child regulator device node
+ * based on supply name
+ * @parent: Parent device node
+ * @prop_name: Combination regulator supply name and "-supply"
+ *
+ * Traverse all child nodes.
+ * Extract the child regulator device node corresponding to the supply name.
+ * returns the device node corresponding to the regulator if found, else
+ * returns NULL.
+ */
+static struct device_node *of_get_child_regulator(struct device_node *parent,
+						  const char *prop_name)
+{
+	struct device_node *regnode = NULL;
+	struct device_node *child = NULL;
+
+	for_each_child_of_node(parent, child) {
+		regnode = of_parse_phandle(child, prop_name, 0);
+
+		if (!regnode) {
+			regnode = of_get_child_regulator(child, prop_name);
+			if (regnode)
+				goto err_node_put;
+		} else {
+			goto err_node_put;
+		}
+	}
+	return NULL;
+
+err_node_put:
+	of_node_put(child);
+	return regnode;
+}
+
+/**
+ * of_get_regulator - get a regulator device node based on supply name
+ * @dev: Device pointer for the consumer (of regulator) device
+ * @supply: regulator supply name
+ *
+ * Extract the regulator device node corresponding to the supply name.
+ * returns the device node corresponding to the regulator if found, else
+ * returns NULL.
+ */
+static struct device_node *of_get_regulator(struct device *dev, const char *supply)
+{
+	struct device_node *regnode = NULL;
+	char prop_name[64]; /* 64 is max size of property name */
+
+	dev_dbg(dev, "Looking up %s-supply from device tree\n", supply);
+
+	snprintf(prop_name, 64, "%s-supply", supply);
+	regnode = of_parse_phandle(dev->of_node, prop_name, 0);
+
+	if (!regnode) {
+		regnode = of_get_child_regulator(dev->of_node, prop_name);
+		if (regnode)
+			return regnode;
+
+		dev_dbg(dev, "Looking up %s property in node %pOF failed\n",
+				prop_name, dev->of_node);
+		return NULL;
+	}
+	return regnode;
+}
+
+static struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
 {
 	struct device *dev;
 
@@ -559,6 +625,40 @@ struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
 	return dev ? dev_to_rdev(dev) : NULL;
 }
 
+/** of_regulator_dev_lookup - lookup a regulator device with device tree only
+ * @dev: Device pointer for regulator supply lookup.
+ * @supply: Supply name or regulator ID.
+ *
+ * If successful, returns a struct regulator_dev that corresponds to the name
+ * @supply and with the embedded struct device refcount incremented by one.
+ * The refcount must be dropped by calling put_device().
+ * On failure one of the following ERR-PTR-encoded values is returned:
+ * -ENODEV if lookup fails permanently, -EPROBE_DEFER if lookup could succeed
+ * in the future.
+ */
+struct regulator_dev *of_regulator_dev_lookup(struct device *dev,
+					      const char *supply)
+{
+	struct regulator_dev *r;
+	struct device_node *node;
+
+	node = of_get_regulator(dev, supply);
+	if (node) {
+		r = of_find_regulator_by_node(node);
+		of_node_put(node);
+		if (r)
+			return r;
+
+		/*
+		 * We have a node, but there is no device.
+		 * assume it has not registered yet.
+		 */
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	return ERR_PTR(-ENODEV);
+}
+
 /*
  * Returns number of regulators coupled with rdev.
  */
-- 
2.46.0.184.g6999bdac58-goog

