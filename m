Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680687;
	b=giflpT1A0MVIWLUu6mVO/c8JgwkSsC/d8akrMiQvR/O5c/aAZzA9FtJRlG6gC9raiv+Y
	 /lruO+urxpMvL4OuSl9EDS3/TlH/puJD/Qzwa37Jrqp37Z23abuQLbyPISDA9NYe69qTD
	 jDTdqC39+XEONqntgw7ERCOvOLlMlsjjoSStrNGe3b2RKUA/hf7BBpjC0YARwQNfVxhRp
	 IJsnKe/fQ4Xw75/ycAa5yHXsbUQSiue+JEAx2ssxdH1jBcsFFWs/ifR9FJuwNA3nPEIqY
	 zFjPp6HzlDhV7Ia5gnkLKNBkO9i2xKNC9utkUHRpWTkqzYgjfz2n8OZx0rmQm5q5q1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h2GPV8kPMdAQMoqvFZFNAZKoDNH2JuPpdXamalsnIvU=;
	b=Bj+t5XLBYq/p6iU3Q9oSXI0BhK2fx/BEt4qC7HrTcES/qcb88OgbUttXy00qHqMMRC1a
	 zFRL8dk1e9zVpE5BWml5OPBqODhes3DTx7xYmVDspRQCoBuKDJlOFBHbBKz7ox4Tk3i6y
	 6nPsObf+eItow+BHVovBB0071IwDpPqmVtP1/lX069JaBmx65W0pRteH74D34LPk3DzIa
	 3lMDsWRfpUfB+zA4+A+2s+cG984kuK+ZeFbP3MROpFKFxZjzHHs1X7mloL7ZCXqy4qDpj
	 2KkLdvmBrMa68JzsIMCgBjpL7aaZXn9f9uiiFeXkqYd0OaKRZIlnU4sD3St3uzPP9ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=P8yrgFie;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92D5606A334
	for <chrome-platform@lists.linux.dev>; Tue,  3 Nov 2026 04:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A92D5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=P8yrgFie
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so2243409a91.0
        for <chrome-platform@lists.linux.dev>; Mon, 02 Nov 2026 20:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680686; x=1794285486; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2GPV8kPMdAQMoqvFZFNAZKoDNH2JuPpdXamalsnIvU=;
        b=P8yrgFie/6T1p23YiaqyQXpdlvECBxon0kR1LAmd4mMk7H08BlX/nETN7e+JEzzngQ
         aE5lxJH7hQrMLNshaXBfUXA9uxeFFR3PiWMQFI5L9r+3K5BrXpKNucuN/ljwJtXp+RXs
         b65sYnjCocC4fuj8VafTSKSsTgDnsb0NLRHKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680686; x=1794285486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h2GPV8kPMdAQMoqvFZFNAZKoDNH2JuPpdXamalsnIvU=;
        b=eSkulrmintZfLWf3GjrZ0quFd7jhaVcyl+mg5tJ/km7tsVACcJuLGzfKzsbeHwAGK4
         6yGn4KQMT3x0FEHlRb/6tgSVSHo/SZN+Pa7k33hMei5FjA2qlu5C48r+M3VZoUl/IkZE
         8l+vtsyXlcuno+VzcZRMq20eDJcNj697xkmStYjVaIG5rVobeyro5mmrIzGTws04oEv7
         MD4d0nTtEeWsGmriyO3neYwiG4MWa92c6fTNp4KFB43tHc1VeI3Oz9B+gtFq95WCPXHN
         p1Y9KQJ+lfgVhmXaG31UiMefGO+laM6kyUVA9Zlh+EeHxKWJO/sgtlAZB3fBv4M98CFC
         zjQA==
X-Forwarded-Encrypted: i=1; AKwUvBx8SDCTm16Pui0APKZmkwfIYgZPmgwyb1VO4wJ9UXgzoAPss9OsxcVoP2ohivI3kBYEnpq0lWwyAqKxoS9AdhE=@lists.linux.dev
X-Gm-Message-State: APuU4Z8v+ZPCf/JyJ15ff+ow4Yu8IV68lxt31pi3SAUSb7VeBze6Dzx5
	j5BhFqWTj8hfS+1PYv2HdnaPHF9oci4EPVczWE6DKug7/mqWU0WSN8quvwGePoP8yg==
X-Gm-Gg: AYBFou1OeJMP4qcu/1k+XhCrH80b7eBffugBXD1dS0J05im8FlSm4RB2mkMRff/HN4Y
	X0Hr6mypJ9nWVjVAU4F8EK2IRLs6xK8ZYZrV9HLM/QkS0SYtNH5PNNCpYt3MPmd0zZQJQz8/G1P
	5SUrSwO0oSE98ldP/5MTlF3lli3uMvE2IqjDJGl0zDulayYVymdqfTgO00mgVoCA5TQ32zMExNh
	Bkk5VkvCcB/es4Up2zKVjvA79RatUofneGBTUlLQETQ4Y9qjS4aEi5smanV+PmosAAIgtT1kiGl
	W1eVhuLqfBoiomcsxaSoRzqVKLiGLdD6+0xvo/WMYJNvITOvrxKaD0oerQACMdkLm3ga/UjaYkp
	WfAoCDobr3DX7Sbv8MtWDUn7CnADtgZgkNgnTsubThuIlYauiKJNJAFXUK35NsJSWWzZjAVEB8C
	NohQrSlYUmSsT8rplhFIpat+43IaX8JJh8lIVJhM016rwGPRF7IUfnystxMv8qtFcgdGBCcTcaF
	BokcujMwpw31Yp6YsCI8sdHSZ0tcRngTkYg4bTt7HG1veXoboPibBl86r2ecgvaEcqUB0q1hjU0
	KPHQDoxzqjZBYFkVUbHcFHiBGjqcOf6eb/QvFaxz8yS+TPxWcX09iOodJkzA/4gManDIQb4ON+M
	KHaxDmTWynImq
X-Received: by 2002:a17:90b:1b0f:b0:3ac:a5ff:2cc3 with SMTP id 98e67ed59e1d1-3ae8957d4f8mr10310774a91.8.1793680685963;
        Mon, 02 Nov 2026 20:38:05 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:05 -0800 (PST)
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
Subject: [PATCH v7 5/8] i2c: of-prober: Let cleanup op know if a device was found
Date: Tue,  3 Nov 2026 12:37:29 +0800
Message-ID: <20261103043734.2179858-6-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The prober's cleanup op may want to do things differently if a device
was found, such as wait for the actual device driver to pick up
resources.

Add a parameter to the cleanup op to pass this information in.

Also fix up an incorrect reference in i2c_of_probe_ops's kernel-doc.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v6:
- fixed typo in commit message and comments
- fixed missing parameter in cleanup op type declaration

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
index bb6d47f50ee5..11f3a05ce881 100644
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
+	 * @device_enabled is true if a component was found and was enabled.
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
2.56.0.385.gac671c819a-goog

