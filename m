Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F02D1CF2B9
	for <chrome-platform@lists.linux.dev>; Wed,  4 Sep 2024 09:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725440441; cv=none; b=EgCF9ICYGlT7TcazqijbxKktTl75uc/nKTOT9Pakm+oXAN3yRatV/liCC6nOqkO7YMas14kItbV+VPSHWigrdBObfsDf+bOOKGZ2OoC0e5ni037wPBEVSHD63xoju42C8MJWDyaMo4IOj3iA55aMxA4OGr1vwAJFKp5KiR68YTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725440441; c=relaxed/simple;
	bh=vfouHZ0OIsqMydCSjbbh9j+9aQPzT5coh1Y7d+J5JLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aw4br+jUVHWapuiqWy619TwjMIyhTLAkjOjTJwNXgVif+/fZd/MAyCUPiDtwL6xvAr0f1H4MUOqKqZrBqjUo2zZHLRbnQeVVkJSxALXfKvs144WTBbJbvNhwclTMrZfm8+mQSIej1w8w9PddzUX9DwrQDSxCRnbHBNRtpA1LB7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cSycY74M; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cSycY74M"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-715abede256so4818905b3a.3
        for <chrome-platform@lists.linux.dev>; Wed, 04 Sep 2024 02:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725440438; x=1726045238; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0sbG/jw58dFVSs3/2Q1ZWzAnnopRuiveILCTgaftSY=;
        b=cSycY74MTtzDGGWL/7ozAJoIP+tTRRwAX6pP1eW4YAjdUDnSPL96KbNjsCOJijCsNj
         fV37Q/DTVATn2eTBmXmJuwimAEU4jup4zgtFampucsQww/WkhXLdRBtb1e6toRkrMkVH
         w1qe9lmmco/PWDmzdgBSuby1W2Xwr7JtYvnuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725440438; x=1726045238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0sbG/jw58dFVSs3/2Q1ZWzAnnopRuiveILCTgaftSY=;
        b=DtKIJh4m9C9HfhugYrBjF3FJopncmJWmnCgT0/YAJ8LXRCqROMCoJZfhafsbylB+gA
         8bvCLTjS5Q0S2Ne03nA4Lb7hjwFBzefgwsHaGaFrQx9cdjkNZuJq9XfYYdkVg6Njmdnc
         qC35guEfdxU+X9slgNL9DyNjgfRa5PnwHPbKYUolGfZThHfuvNJU8g9AcAhAqwmyaD6Z
         9+wCNghy6Z59nM44pQkly5gGsSQB5HsIFTwSwTKdXreM0nlSm9itEG+wtwY0WXPLVS1Z
         MqobizIIMeMf2tkVOynzEoHcbLtjQpmJIwrWM/UewACUPaJMg9KSe9db4DWq0REFKWSd
         pGOw==
X-Forwarded-Encrypted: i=1; AJvYcCVB7uURBh7X7pyD9nr/8lNcb1kr6oEEWzpmb8/PYW3AB2I/bqxFk6VXF2aSvblHWDDoe2+rG4YemZow08cRhIw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5AO9nvGLfDpDHTwJX2ha4fLHZqGpLk9xWLqhe6Ql3HK5qn7It
	v+/YFDAeCJ5dWxbNr7FdmDPCOLJIwygirfDR9Kz6yBgl6I+d9QAHM3NsWVNYmg==
X-Google-Smtp-Source: AGHT+IFJnhX8EeVHE/Pb/2Pe1cdA+zN3kwfbn5THcKUWQl9Uebvww0bAh3IhVagxcNqMcqnK8VZyqg==
X-Received: by 2002:a05:6a21:6e4b:b0:1c6:ac08:8dd2 with SMTP id adf61e73a8af0-1ced6087aaemr11569081637.15.1725440437588;
        Wed, 04 Sep 2024 02:00:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:83fc:5c8e:13bd:d165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717785b5183sm1153279b3a.197.2024.09.04.02.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 02:00:37 -0700 (PDT)
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
Subject: [PATCH v6 04/12] regulator: Split up _regulator_get()
Date: Wed,  4 Sep 2024 17:00:06 +0800
Message-ID: <20240904090016.2841572-5-wenst@chromium.org>
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

_regulator_get() contains a lot of common code doing checks prior to the
regulator lookup and housekeeping work after the lookup. Almost all the
code could be shared with a OF-specific variant of _regulator_get().

Split out the common parts so that they can be reused. The OF-specific
version of _regulator_get() will be added in a subsequent patch.
No functional changes were made.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Fixed kerneldoc "Return" section format for _regulator_get_common()
- Slightly reworded return value description

Changes since v4:
- New patch
---
 drivers/regulator/core.c     | 54 ++++++++++++++++++++++++++++--------
 drivers/regulator/internal.h |  4 +++
 2 files changed, 47 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 835a5531d045..d60c86477ac2 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2103,26 +2103,43 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
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
+ * Returns: pointer to struct regulator corresponding to @rdev, or ERR_PTR()
+ *	    encoded error.
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
 
@@ -2238,6 +2255,21 @@ struct regulator *_regulator_get(struct device *dev, const char *id,
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
index 8e5506c5ee94..5b43f802468d 100644
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
2.46.0.469.g59c65b2a67-goog

