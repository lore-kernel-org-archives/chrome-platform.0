Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCB4181BA8
	for <chrome-platform@lists.linux.dev>; Thu, 22 Aug 2024 09:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724318434; cv=none; b=PyO9I+JBFwv1KcLVFWxRTj3XvTgp8zbTJ8gb+9A92h9FORL2h+P0nXJWbBP/P9y5xsYbkATqwsO33KXMjtfJJkIsqSYE1xMYYjI09gswnHwGYhlsBZVkAbs4BbNDEWhc1GfOnIlcOyG5jTUmoxniZFvD9BHovtkvSUzVvHWH8dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724318434; c=relaxed/simple;
	bh=F4P2nmGS6A9jyMX3gZMS4FBUKJs6ahBUb0pWZbTHLOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqyT6hAf7dUDfIIhcdKPz5DGcRc5BPC1bXE8S/u13OYqtsTP+b2yJajQqZrSAamZkiPH7QdUSjUnRVtOxKH7yMSDENe03de+OXJGO+BUtuqLfzt0l2Mmy5hn7G2h5x6Z4K3GputGlkXGwXtw6rtG+exppwhqMkd4JkKWZMHKA/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Mu5/W5Yx; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Mu5/W5Yx"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7cd76b56e59so206858a12.2
        for <chrome-platform@lists.linux.dev>; Thu, 22 Aug 2024 02:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724318432; x=1724923232; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQ/ais/DnW2DhkO42fRSNxxKCNt0O583PTfpQXJv2Js=;
        b=Mu5/W5YxmcWKdfgmV0kGEpc/ArIBVY9GUSeQa90rKHUS0vOw3JH+ujU4JohJmD46gr
         0NDadurVMXVVn3gm0dWQ32wCGSL0hxvjHgRjuS45FvawzA9gVG+tEyiBnnuZD36djG/H
         SARjTIaYVgZomfDn5ES86xDeU30WJeufVhU0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724318432; x=1724923232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQ/ais/DnW2DhkO42fRSNxxKCNt0O583PTfpQXJv2Js=;
        b=qICHo3NbRG3kT+RQgcT7ytuWU3CHf0seRHwmRx+KtupJGWhdvFGchMWr7gGjjmGrQJ
         AsFGx0t4LUdCGQSfWlwLipdZ3w0h5upQoFGsfMT6dQb/fek7kFqP2vak2LLPN8Tp3R7u
         Tj95DGFPP9JRBTXxGFR/F1rHsPWy3zFAHZtdx9uwc1emUkf1MqLaVcJVm4lExFlpuYbv
         nVtBNsrNG5Iza5BPCdqcQDjpSdj0Z0aWAypPIsx3oNLeLh7a9f+iYeWQKaQoPZE3jNvG
         rf7cMBAGcr0yfqLRw9Jg06KvgoymrhV4NJ9zaHLq+EoylRnXbA/cOXK4oBph9iR8fi7I
         ARdg==
X-Forwarded-Encrypted: i=1; AJvYcCWMv7vRKZr70Rc8jOFSiCv8vfQNlDah5Ec0u0K/Scx0mWfq2Q8Tg7MZl6ljHGkX7koCJnvck+GKHVP4gF2MHiU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/GA2/RT2KRITH5Lo96hoqJdn8UH0SiY2WZt+LMVACouaz7Ick
	UYU77sNrpoxtq9ZUVfJPRScAqYQSakkiGuJzdKSjVG6r3Yfm+3UdvzVYgP1OwA==
X-Google-Smtp-Source: AGHT+IHNX1mTbdGkDuNm269HAAWFLZMuunhBrLdO555YXJUIWEo+jUShOHk7j43VZg4OPf7/Roe+/g==
X-Received: by 2002:a05:6a21:398c:b0:1c6:f9ea:f2df with SMTP id adf61e73a8af0-1cad7f89598mr5999512637.12.1724318431795;
        Thu, 22 Aug 2024 02:20:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8470:6a67:8877:ce2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434335e69sm951398b3a.194.2024.08.22.02.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:20:31 -0700 (PDT)
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
Subject: [PATCH v5 03/10] regulator: Split up _regulator_get()
Date: Thu, 22 Aug 2024 17:19:56 +0800
Message-ID: <20240822092006.3134096-4-wenst@chromium.org>
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

_regulator_get() contains a lot of common code doing checks prior to the
regulator lookup and housekeeping work after the lookup. Almost all the
code could be shared with a OF-specific variant of _regulator_get().

Split out the common parts so that they can be reused. The OF-specific
version of _regulator_get() will be added in a subsequent patch.
No functional changes were made.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- New patch
---
 drivers/regulator/core.c     | 54 ++++++++++++++++++++++++++++--------
 drivers/regulator/internal.h |  4 +++
 2 files changed, 47 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 361309fcae57..4d1c640cc030 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2093,26 +2093,43 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
 	return ret;
 }
 
-/* Internal regulator request function */
-struct regulator *_regulator_get(struct device *dev, const char *id,
-				 enum regulator_get_type get_type)
+/* common pre-checks for regulator requests */
+int _regulator_get_common_check(struct device *dev, const char *id,
+				enum regulator_get_type get_type)
 {
-	struct regulator_dev *rdev;
-	struct regulator *regulator;
-	struct device_link *link;
-	int ret;
-
 	if (get_type >= MAX_GET_TYPE) {
 		dev_err(dev, "invalid type %d in %s\n", get_type, __func__);
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
 
 	if (id == NULL) {
 		dev_err(dev, "regulator request with no identifier\n");
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
 
-	rdev = regulator_dev_lookup(dev, id);
+	return 0;
+}
+
+/**
+ * _regulator_get_common - Common code for regulator requests
+ * @rdev: regulator device pointer as returned by *regulator_dev_lookup()
+ *       Its reference count is expected to have been incremented.
+ * @dev: device used for dev_printk messages
+ * @id: Supply name or regulator ID
+ * @get_type: enum regulator_get_type value corresponding to type of request
+ *
+ * Returns a struct regulator corresponding to @rdev,
+ * or IS_ERR() condition containing errno.
+ *
+ * This function should be chained with *regulator_dev_lookup() functions.
+ */
+struct regulator *_regulator_get_common(struct regulator_dev *rdev, struct device *dev,
+					const char *id, enum regulator_get_type get_type)
+{
+	struct regulator *regulator;
+	struct device_link *link;
+	int ret;
+
 	if (IS_ERR(rdev)) {
 		ret = PTR_ERR(rdev);
 
@@ -2228,6 +2245,21 @@ struct regulator *_regulator_get(struct device *dev, const char *id,
 	return regulator;
 }
 
+/* Internal regulator request function */
+struct regulator *_regulator_get(struct device *dev, const char *id,
+				 enum regulator_get_type get_type)
+{
+	struct regulator_dev *rdev;
+	int ret;
+
+	ret = _regulator_get_common_check(dev, id, get_type);
+	if (ret)
+		return ERR_PTR(ret);
+
+	rdev = regulator_dev_lookup(dev, id);
+	return _regulator_get_common(rdev, dev, id, get_type);
+}
+
 /**
  * regulator_get - lookup and obtain a reference to a regulator.
  * @dev: device for regulator "consumer"
diff --git a/drivers/regulator/internal.h b/drivers/regulator/internal.h
index ffeaef22169e..3718459fb0c5 100644
--- a/drivers/regulator/internal.h
+++ b/drivers/regulator/internal.h
@@ -121,6 +121,10 @@ enum regulator_get_type {
 	MAX_GET_TYPE
 };
 
+int _regulator_get_common_check(struct device *dev, const char *id,
+				enum regulator_get_type get_type);
+struct regulator *_regulator_get_common(struct regulator_dev *rdev, struct device *dev,
+					const char *id, enum regulator_get_type get_type);
 struct regulator *_regulator_get(struct device *dev, const char *id,
 				 enum regulator_get_type get_type);
 int _regulator_bulk_get(struct device *dev, int num_consumers,
-- 
2.46.0.184.g6999bdac58-goog

