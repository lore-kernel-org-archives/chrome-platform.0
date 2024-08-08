Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2471B189F48
	for <chrome-platform@lists.linux.dev>; Thu,  8 Aug 2024 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723111189; cv=none; b=gBnj7qfggTaH0gLMJcMNyaXO8D6+R3bd58Q9LGS9lOQy/UKDi6fEkAszACpnPC4K0MEw0yWr8hFVoFzlS1GFr646C7uaAC0DLfX7xpcNE+iB7mpWHmjoWxTJhBFb9K8KlgiunJYHEKkyqvgDp0MA7/66pR95ISAU9HihnlPkqXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723111189; c=relaxed/simple;
	bh=H0FOBfwEBWtywgtjSA1F4rTZQ5wzYjAwhkmuhYnKTxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zwg1wPW1Pzck0mrTdUSc9Uu7XpkPHdFx/cIolLvjKnht24WNPmSvbt1NuKK7rSuiO2GsqHnqKpM3JPsNE1WKy9pjtWnPXZZe1237N7Nlp7S/x47gFNHip+ENvDje9g23xcDzIysaiABV52oxay+zrgm/mu2f7LVAWuyAHbHcnfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b4oflV7o; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b4oflV7o"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fc587361b6so7787465ad.2
        for <chrome-platform@lists.linux.dev>; Thu, 08 Aug 2024 02:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723111187; x=1723715987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnHNs8RGUpugUdHA2OImjbnnj6+rNsZeKGSTnE9NGbI=;
        b=b4oflV7ouamT51Hf/VeVjqGfGFtJlvU9l1+IDupyE7NiIsogH3jFDBCMr9yAKzKjS5
         V4FOWJxf23Yt6CcdJQcmPTak+QGDs13RTRAwZ5SPyfK87uE45beIRPteraQaraF0CXvQ
         N/y/o6kkaZ5mpbkiGO/vSGyQEJylsfGB3Qkic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723111187; x=1723715987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnHNs8RGUpugUdHA2OImjbnnj6+rNsZeKGSTnE9NGbI=;
        b=EayGEhzL8VfsFEoj+TWJeUK5nbQ2NN+pCjYTdV8kJdVZp/c3ayuOdaQd9dFXXEsRu7
         1tVnWGMR7oTf2FucVYxSzJ+u1KgRdSD5O6T5AxDhZI/9pwd7hpP9AMgUSLIdBFvHOu7S
         QOiZkpDeCdSxb2sk+8FVm0OBkb9EHNUmyVYRngX6iLmWwOtsoCOIPV9GLFwHyy9HXj4p
         GmamCKylQSJIwd9ItX5t0oc+XFvt2i6/f5JlF7aKS/gEzEYdHdGMOOnxfrFZHD/hXEkU
         h7ZH6d6MkU/QvLJbULZkkDxnKCtCFcAU8OeBXy3bN+Io2Ju73FTpD75cHe0RTdosapXT
         pzwA==
X-Forwarded-Encrypted: i=1; AJvYcCUNpNFdV91NjxWkQyViXCvAHfnQW7Z2AuBR6UOlvllcTAGIYaDy+NGll9B8DiXJ6sGJMvlo5Ij5IifMpcn+2OB5c9aHwNooPw7ZG/rQSPr2
X-Gm-Message-State: AOJu0YxO0w6Y0HAN0kzle14xSery62we0/JD5Gd+cVCvjSMEC6a7ch+2
	/wEM4LmQ6iJuCgCPD3yBXqHxaKt6OfTBkPWvWf0TebjLQ+QNzEFX4+7OjsV+uA==
X-Google-Smtp-Source: AGHT+IFIftWwmlbWRkGBzfDMk0j7k5O8rm8KVgSziXqkMdFzRmZhlp6LCbkz+1PDSOvY9LkVZKP1dQ==
X-Received: by 2002:a17:902:ec8c:b0:1fd:9c2d:2f27 with SMTP id d9443c01a7336-2009524a0edmr15321085ad.24.1723111187412;
        Thu, 08 Aug 2024 02:59:47 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8b53:87e6:914:a00d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59297707sm120784985ad.254.2024.08.08.02.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 02:59:47 -0700 (PDT)
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
Subject: [PATCH v4 1/6] of: dynamic: Add of_changeset_update_prop_string
Date: Thu,  8 Aug 2024 17:59:24 +0800
Message-ID: <20240808095931.2649657-2-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
In-Reply-To: <20240808095931.2649657-1-wenst@chromium.org>
References: <20240808095931.2649657-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a helper function to add string property updates to an OF changeset.
This is similar to of_changeset_add_prop_string(), but instead of adding
the property (and failing if it exists), it will update the property.

This shall be used later in the DT hardware prober.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---

Changes since v3:
- Use new __of_prop_free() helper
- Add new line before header declaration

Changes since v2:
- New patch added in v3
---
 drivers/of/dynamic.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h   |  4 ++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 110104a936d9..dfd1358d59d5 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -1072,3 +1072,47 @@ int of_changeset_add_prop_bool(struct of_changeset *ocs, struct device_node *np,
 	return of_changeset_add_prop_helper(ocs, np, &prop);
 }
 EXPORT_SYMBOL_GPL(of_changeset_add_prop_bool);
+
+static int of_changeset_update_prop_helper(struct of_changeset *ocs,
+					   struct device_node *np,
+					   const struct property *pp)
+{
+	struct property *new_pp;
+	int ret;
+
+	new_pp = __of_prop_dup(pp, GFP_KERNEL);
+	if (!new_pp)
+		return -ENOMEM;
+
+	ret = of_changeset_update_property(ocs, np, new_pp);
+	if (ret)
+		__of_prop_free(new_pp);
+
+	return ret;
+}
+
+/**
+ * of_changeset_update_prop_string - Add a string property update to a changeset
+ *
+ * @ocs:	changeset pointer
+ * @np:		device node pointer
+ * @prop_name:	name of the property to be updated
+ * @str:	pointer to null terminated string
+ *
+ * Create a string property to be updated and add it to a changeset.
+ *
+ * Return: 0 on success, a negative error value in case of an error.
+ */
+int of_changeset_update_prop_string(struct of_changeset *ocs,
+				    struct device_node *np,
+				    const char *prop_name, const char *str)
+{
+	struct property prop;
+
+	prop.name = (char *)prop_name;
+	prop.length = strlen(str) + 1;
+	prop.value = (void *)str;
+
+	return of_changeset_update_prop_helper(ocs, np, &prop);
+}
+EXPORT_SYMBOL_GPL(of_changeset_update_prop_string);
diff --git a/include/linux/of.h b/include/linux/of.h
index 85b60ac9eec5..046283be1cd3 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1651,6 +1651,10 @@ static inline int of_changeset_add_prop_u32(struct of_changeset *ocs,
 	return of_changeset_add_prop_u32_array(ocs, np, prop_name, &val, 1);
 }
 
+int of_changeset_update_prop_string(struct of_changeset *ocs,
+				    struct device_node *np,
+				    const char *prop_name, const char *str);
+
 int of_changeset_add_prop_bool(struct of_changeset *ocs, struct device_node *np,
 			       const char *prop_name);
 
-- 
2.46.0.rc2.264.g509ed76dc8-goog

