Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00596470E8C
	for <chrome-platform@lists.linux.dev>; Tue,  1 Sep 2026 07:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249010; cv=none; b=q0719cuXdsY+jy8I8oFmJP/rDzZksLfdVWtGR/r37Ge0y8XU1mviOTqYbU8WKgPMtP0XxuYRUiOcUCoabgURPeqdBtSvyt5OiIZMN2y8nDZ4CuJSlKxwifCliTzwOF7S0BUpog9yKNf9K8rwUwD+wdmuB7giR8+UVJJFv0/W9K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249010; c=relaxed/simple;
	bh=6ab1wCEQP5zPcBfT0PBKodK0oU1IQzXD1fGtvF3pHJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8rp5PmXqD+3EQS/PAixeUNjVD/PS8E5tcFYEbDKLNr4uvfdWGUpO4LbmM0uWqQfiIHYT9+LYhZXc9K4lUTmP00260JIxOmAM9iWSS4YRUe50Vh6FCmPL1qYzYLGy/4vo3VRopCqo7oqpX/lypGjj8J+cqnVMfgCPQnnIjFC2L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E0VrkbaM; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E0VrkbaM"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d715f4a587so8227485ad.2
        for <chrome-platform@lists.linux.dev>; Tue, 01 Sep 2026 00:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788249008; x=1788853808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=377z9agroO9vgw/MPipyApHAj2rPTrxxSFp/0FEh+cY=;
        b=E0VrkbaMHia1GNupEnC6MoZSV2FnI26h5lnMDvsbMOc76AqQZdpJGJpoAQQYsdo8Po
         47sCE7ChbgBWJjBzXb3JWODtln+6/Ihb6yIHauFH1MwjS5DEONOwh1c5f/IC2FvW7M9v
         hTxSZwsSUshptY2ac9471iBZVmHesJlcP/2As=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249008; x=1788853808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=377z9agroO9vgw/MPipyApHAj2rPTrxxSFp/0FEh+cY=;
        b=C66PafhNlJ5tSrRrgX/V3S4tgDJOKxt9JEqSA/cxIk9sqRlbvHsW3H4hMh/ItBjvbC
         sdayG+/Hh0rvbHsM3j7JGz68t08/mtAeYSXu7WU6MiLrty7Eke5tCqoqWDbiFC4OZ4h1
         XG5RGTC99iS90dEcVbB+To/MOxrRuJu6L8fNyGCYYs53F4NocNeZ7OJUlTxHJSUrZhwW
         vKNR5zDbfTfNSt6yry3QwLDuV5rUHAsaKDVEnwWeY+SAQxu/M9NABWuFEBtURPjKPQEy
         Mx5o9c2B9FxTKpqO5FCxH7SqRoYGqXsfKLS1PUlRkeCy27vlVjuLCSTlAHS182FGH/oL
         LLkg==
X-Forwarded-Encrypted: i=1; AKwUvBxQpxZF4fWoj2zckcTgFAbEkuasNA5XyXRWGrl+Qqi/RJhNAkTIDCGUloIuCCI/WDQuVgzZW9az2bJxB1UaAB0=@lists.linux.dev
X-Gm-Message-State: AFuF++m1rCBU8erxcBf0amPruS4TKZQbfsBrhZDzq8XyyDqF6AxgyTmI
	giJI+emfFSUo9WOGZqjq05H2i/K/djsDCFhtRNXHaUxZm+NX3croPDviRcwRjPv0Vg==
X-Gm-Gg: AYBFou2g40eKTVsVq29u9rlaTg4yBs2D+y6mOCOCaKRY6f64dtLTbFNdqhgIgGPLl4r
	PXq/81sQUGJPkv7TJT8XRvgwxrJdOpzRb7vpCWzXgzPliuDv5LxkNvAyBgnrmxk7FBTcjOieEr2
	qAURMAatL6IDOCcVv9BoQ0RhIHJpPPC9gdIbqPbvka3kd4ssolS1YUZO0RLhsydWsqPZIagqFPX
	MoKIzsxkUjD16/ED873+BKiT3TRUCvPrmXsDEtt7dzEPKov4YmYdQqbaddtiseGLwRoype561wK
	DgeXYJadGup4pym/TeKRx8u/efS6iBI02Opi6nhghUhRD5YwBHvU544y5IZh2jLl1wcXNqnQcSf
	7ufKDckxarcW1dhkFEp3Y3SeP+Oet5fRMjs/DpM65tkGikj4elXAcriAo1l+TZj6zXXtrKXx8Ko
	V3LtchzNDawNgI4OXc4wW+FUTx6ztyrhT+BFnv9pRMzC3vXLcKD2mE8BkFG47G0qHcVIkXVADfX
	aDforsVfxOmGFMYD7cL2otYocqtKls+20pfl20m8wtR7g==
X-Received: by 2002:a17:902:ef52:b0:2d9:383a:30f1 with SMTP id d9443c01a7336-2d9383a326bmr139940935ad.4.1788249008298;
        Tue, 01 Sep 2026 00:50:08 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:50:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/8] i2c: of-prober: Let cleanup op know if a device was found
Date: Tue,  1 Sep 2026 15:49:23 +0800
Message-ID: <20260901074930.764550-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The prober's cleanup op may want to do things differently if a device
was found, such as wait for the actual device driver to pick up
resources.

Add a parameter to the cleanup op to pass this information in.

Also fix up an incorrect reference in i2c_of_probe_ops's kernel-doc.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- New patch
---
 drivers/i2c/i2c-core-of-prober.c | 8 ++++++--
 include/linux/i2c-of-prober.h    | 7 ++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index f9f3c0ef93ff..97ef58bb4c04 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -130,6 +130,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
 	const struct i2c_of_probe_ops *ops;
 	const char *type;
 	struct i2c_adapter *i2c;
+	bool device_found;
 	int ret;
 
 	ops = cfg->ops ?: &i2c_of_probe_dummy_ops;
@@ -159,6 +160,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
 	if (ret)
 		goto out_put_i2c_adapter;
 
+	device_found = false;
 	for_each_child_of_node_with_prefix(i2c_node, node, type) {
 		union i2c_smbus_data data;
 		u32 addr;
@@ -171,12 +173,13 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
 		/* Found a device that is responding */
 		if (ops->cleanup_early)
 			ops->cleanup_early(dev, ctx);
+		device_found = true;
 		ret = i2c_of_probe_enable_node(dev, node);
 		break;
 	}
 
 	if (ops->cleanup)
-		ops->cleanup(dev, ctx);
+		ops->cleanup(dev, ctx, device_found && !ret);
 out_put_i2c_adapter:
 	i2c_put_adapter(i2c);
 
@@ -388,12 +391,13 @@ EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup_early, "I2C_OF_PROBER");
  * i2c_of_probe_simple_cleanup - Clean up and release resources for I2C OF prober simple helpers
  * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages
  * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
+ * @device_enabled: True if a device was found and enabled.
  *
  * * If a GPIO line was found and not yet released, set its value to the opposite of that
  *   set in i2c_of_probe_simple_enable() and release it.
  * * If a regulator supply was found, disable that regulator and release it.
  */
-void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
+void i2c_of_probe_simple_cleanup(struct device *dev, void *data, bool device_enabled)
 {
 	struct i2c_of_probe_simple_ctx *ctx = data;
 
diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-prober.h
index bb6d47f50ee5..f28a40780d1f 100644
--- a/include/linux/i2c-of-prober.h
+++ b/include/linux/i2c-of-prober.h
@@ -45,7 +45,7 @@ struct i2c_of_probe_ops {
 	 *
 	 * Only called if a matching component is actually found. If none are found,
 	 * resources that would have been released in this callback should be released in
-	 * @free_resourcs_late instead.
+	 * @cleanup instead.
 	 */
 	void (*cleanup_early)(struct device *dev, void *data);
 
@@ -53,8 +53,9 @@ struct i2c_of_probe_ops {
 	 * @cleanup: Opposite of @enable to balance refcounts and free resources after probing.
 	 *
 	 * Should check if resources were already freed by @cleanup_early.
+	 * |device_enabled| is true is a component was found and was enabled.
 	 */
-	void (*cleanup)(struct device *dev, void *data);
+	void (*cleanup)(struct device *dev, void *data, bool device_enabled);
 };
 
 /**
@@ -131,7 +132,7 @@ struct i2c_of_probe_simple_ctx {
 
 int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node, void *data);
 void i2c_of_probe_simple_cleanup_early(struct device *dev, void *data);
-void i2c_of_probe_simple_cleanup(struct device *dev, void *data);
+void i2c_of_probe_simple_cleanup(struct device *dev, void *data, bool device_enabled);
 
 extern struct i2c_of_probe_ops i2c_of_probe_simple_ops;
 
-- 
2.55.0.897.gb25b4bd76c-goog

