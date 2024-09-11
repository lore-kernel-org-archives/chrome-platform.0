Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EA013C80E
	for <chrome-platform@lists.linux.dev>; Wed, 11 Sep 2024 07:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726039704; cv=none; b=PkYtmsdb2pwYhWioRbrDPqxF4hSAKxu9oqqI/oT2807n/7N47Akmp17n2eUVKOx0Nnl81l4lmtobjZfI9rpS2WtbS2l5So/b57nFgTM+4P3O/14E5I3eeSa4OSK9XyjuuKy1xdG83hQNdwU8e0MotyAeljtIPQW9Av9SpOiWM0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726039704; c=relaxed/simple;
	bh=zj/HJDeowM5ESxF1vN4op15RGlHBPvxyJE3xPNXJ1vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GO7ZdqLP/Qe5u+dbQGgMwAUE2CUS3NZ50sPnKltSnLxP+KiFR7lAlXzYqD5viRARihNXQdxodcUuF84vYOHR/Tr7cnq1QEyoOhjlAEHTOokklZt4s4HnJLk0f4MzIb7SJLtrH2X7s8IuCsAafVm9fP3n17juWeZCKzYRjJV4k24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hJIaZbSp; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hJIaZbSp"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-718816be6cbso4562094b3a.1
        for <chrome-platform@lists.linux.dev>; Wed, 11 Sep 2024 00:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726039702; x=1726644502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XBl4KvAxY2W5qf9J8VaXaQIQeHry8eBV5yNyqGAqXM=;
        b=hJIaZbSpelBTKhvxgWu4MkNxWUiybMNeeuUMn3sOxYzI0PUaeNg5WhW8aT+xbiZU2e
         Fyy6bW2tMHLA8EzVuBbeYNIKvyPdtaWnCdKtPvS77f33IXCH+n1Z7TLzTpFYjvGLAtj7
         B5VfcMMXrvK/fTlUZ5IQM4nCH+lrdGdXpXpdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726039702; x=1726644502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XBl4KvAxY2W5qf9J8VaXaQIQeHry8eBV5yNyqGAqXM=;
        b=rHpNIiR1gk+BzJSYn9cSurUngfppSX8ZYq9HquWvsjS0ci0LLEp9LRkJH0C0/i1thR
         tmwmlzHzqsYnpDNudsCcgjw/RD9V2T0eNOLzTvPRrfr5WWxpTP4EB8lOudvrM6HbmEwe
         f6hCn40x6M41B8It2jNQPQqDeUalzvPuk9X3bla9DUECfIfT1Egb1zkApcq0eaiWgOkZ
         Mgx2cJh6p91oX6D5Na03s+DJIetyS+bzIUoaImFJJXdlWBdPzHekOtJNbQr7iDmYqxNx
         1stYu9sd7sRboT6r3005YXg1noheAoh+3kIUbWleMdfAz0XJf8JC9ULISY0MDNc1V6Ia
         1vtw==
X-Forwarded-Encrypted: i=1; AJvYcCXCIDu6YFbwaq/QoSuAeiWNnkUIape2VNyiJ48JUmU3mYPOl056j4I/tZvc1b3pmZBY9moh0lNMnDi511Q74gg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx/sk0GKatHrQfbtIt0fRsQfN2S8kKm1bEvJUZOYH/JbJ64fnO
	8hNM4L4On/1GcuUE2++0xSyvvRvW0EXsyTDLKXhj8a3OOv8F2cJM45J5HUyh8A==
X-Google-Smtp-Source: AGHT+IFjUTc14exhMNLPWpC6tKqxzxp/QnxrLH5ALh3HkEgdTdW2uDtj4xbh/J245j8YHjY14LvqFA==
X-Received: by 2002:aa7:8887:0:b0:718:d96d:34d7 with SMTP id d2e1a72fcca58-718e3f9caacmr18512422b3a.3.1726039701972;
        Wed, 11 Sep 2024 00:28:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8398:fe34:eba2:f301])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe4e7esm2399415b3a.80.2024.09.11.00.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:28:21 -0700 (PDT)
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
Subject: [PATCH v7 01/10] of: dynamic: Add of_changeset_update_prop_string
Date: Wed, 11 Sep 2024 15:27:39 +0800
Message-ID: <20240911072751.365361-2-wenst@chromium.org>
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

Add a helper function to add string property updates to an OF changeset.
This is similar to of_changeset_add_prop_string(), but instead of adding
the property (and failing if it exists), it will update the property.

This shall be used later in the DT hardware prober.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v6:
None.

Changes since v5:
- Collected Rob's tag

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
2.46.0.598.g6f2099f65c-goog

