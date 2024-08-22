Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7689D17E003
	for <chrome-platform@lists.linux.dev>; Thu, 22 Aug 2024 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724318427; cv=none; b=uqI7XsLshyBBhlZAI/JwkKTQtkGfzhgn24zFKY1LYcV3fJahBlMa+5zvZYkyxBEuk3IYf+StnaLhxbdqJB1buS45J2YBBD0jkKaYj7JFugDfAnkNnJreOgpyz/WEA1FT4WfPVVUtnqoG+yCuOGq2EbqQeFiXRqUAqq3Huk6h45c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724318427; c=relaxed/simple;
	bh=UpiWOo/TltGJssQsJUrLPTTkx2+aS45gddRc0ilmepo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mXTjqH210msFkK5I1UpPojg+l+9KtBOBI00FAaPxu9PzEZBkMqplZSrXjNgWicNspC2go0YAmQcSVIuvqsHtuABN0XW2JU2/7hW/aZuDt25TpCH8oO2CMaUhhI+cWG+cyepN0d5EvlZJ2R2TbO8xWJNgj95v4ioHp2+ZQ8ZAqjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n7qYfjV4; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n7qYfjV4"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7140ff4b1e9so459897b3a.3
        for <chrome-platform@lists.linux.dev>; Thu, 22 Aug 2024 02:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724318425; x=1724923225; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJpiCpdFfWAtf8uPPEuTBRfORRdyXl0KF9nHABZqeeQ=;
        b=n7qYfjV4fn4tn/i9C5X8a0q7CX7T1wXGCVfaPYWDCadgydMXTvk1wzxtHdXX4weLAu
         TRsKl60fr3TCwPHE7iBrPJrX1oui/DqLtd6iZ3A6Ap65iD7aAkpO+Uixv5XcYLl2hQg6
         nDshLPEfKfxEI8x/MoLOnR9OpcwYUqzlhdG9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724318425; x=1724923225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJpiCpdFfWAtf8uPPEuTBRfORRdyXl0KF9nHABZqeeQ=;
        b=DWdyl2bj81Ek28JCEU9q++MhwpFKsM3kcKLV5feTIqtey9as0GDJm1is+UAmRXOoqy
         dLE0DyNhSdfBoJYIe9B9e08xQCrEIUS2s7euW8lRBNWKp4M18KX9Bc4AZ+Y/8slldkTn
         VOPuRvNfDhmtmAOAtKCYPK8SOdVfbpYs6NnoyT/cUIJln5yI2a0vEQQzZSHIDxzGJYHg
         4sdGAbaLzFebg696TKQ0Q7NF57JrXE+l5c3cZ8rm1VFB70ky65SYvDpW2xqoCrb6db6I
         HfQq6gd9JzYP4ElXi8bMub9bXv/xxVvtg4EUghivYjKhAIRIZ1YWbkiuzSOdx4U4AD1i
         e2AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUljqSQZuT/GHdgMSKH9YdgsfNBCHHI/CrAbkeT6PDhp04NZgO+iKkUI/HI1RapqEX4RF1ic+A6yVR1VW81LUQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOHXC0StaN7Lf2uD9uyNv8xVSINlVDFuK7wl7RMzVJg2kQftN6
	ZffucDaNc5GUCxubU9UtPK2PAKbxSy7uhMa8YgU2qiOgAxTYotO/IPejhD3Reg==
X-Google-Smtp-Source: AGHT+IF3q7kEnTwTdOeElAbMIG4ut51tj+GRpPErjT+Nd/r+ne8//cdW649YGpsOCjtM4GbM7nHD1A==
X-Received: by 2002:a05:6a00:2288:b0:70d:2a4d:2edc with SMTP id d2e1a72fcca58-7142353f2bdmr5844551b3a.20.1724318424602;
        Thu, 22 Aug 2024 02:20:24 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8470:6a67:8877:ce2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434335e69sm951398b3a.194.2024.08.22.02.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:20:24 -0700 (PDT)
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
Subject: [PATCH v5 01/10] of: dynamic: Add of_changeset_update_prop_string
Date: Thu, 22 Aug 2024 17:19:54 +0800
Message-ID: <20240822092006.3134096-2-wenst@chromium.org>
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

Add a helper function to add string property updates to an OF changeset.
This is similar to of_changeset_add_prop_string(), but instead of adding
the property (and failing if it exists), it will update the property.

This shall be used later in the DT hardware prober.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- Use modern designated initializer for |prop|

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
index 110104a936d9..daa69d160a78 100644
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
+	struct property prop = {
+		.name = (char *)prop_name,
+		.length = strlen(str) + 1,
+		.value = (void *)str,
+	};
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
2.46.0.184.g6999bdac58-goog

