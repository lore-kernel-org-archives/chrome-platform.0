Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F422E40D598
	for <chrome-platform@lists.linux.dev>; Thu,  9 Jul 2026 17:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616417; cv=none; b=L9sCxP6wnZS7Tzjb+h40khCk9ATTGhWg1yET1mGxlGJjdcd5rVBLZ1Xj2tZONScekXnzkIFIg241bJ6dbvB9jpm1ahskIkp94ax2y36IA9JoF7l3XwddqASOOHmH4bGAKHoV2ZLd+ZoItKTkU+GTHMlOL/mMiXmRAKL4Umc6iFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616417; c=relaxed/simple;
	bh=qaHMCDQ0wnCBevuvFZFgR8vFowOppWXNbsk1WmPicyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y1BdUVkZxKBJ7tdjwWrzAcDcnk3RG9jtbGnoxMGIJ70pVk8wCanObUqp8pzb8tkIx2eimiAm0kq0I3TatT+h2RJseaP6Fd63iEXax5PKUdavCstC87xmGqwiqr8Sp8pZo0aX+QDylq2kFDusc4efB9Vg2oe5F758bRCcss1ni4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fOrO52Uw; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fOrO52Uw"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-472326ca506so75971f8f.2
        for <chrome-platform@lists.linux.dev>; Thu, 09 Jul 2026 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616414; x=1784221214; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ftx4kksthHB8P8rF6BFuSI8P+XMB3UDpz0Oz9g7bP1I=;
        b=fOrO52Uw98Jr1V6/EjzhyvfXSmyHm9TQDqdhKGRKoQ/zPXDed+RtOJiovAu13M43Xr
         Bm8DmRk+3MWUQKyI4VdgEerjfpNlBLwfNIKs4qoHvhf7viKnqNl/ZEloWHl0Y2bqAkkd
         DLnDd8WrqtLMx789f04UPKMAt4q1/3LwPpnfzbQepWWAUFk7YPsWATw0JdYtzPsgDVzd
         L7x3bDkN+9mGaXv07B2OTPPQkxhWLm853By1vr+exOnzyRv9eRJkYquY/RrhEhl0AZLX
         dHhWAhkCUrf7/UAgq+nALDY7vwO+d1P0j5JfyvbJFQmdQ3uwQ0/6JbCSB0uZlxxAsOHS
         rDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616414; x=1784221214;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ftx4kksthHB8P8rF6BFuSI8P+XMB3UDpz0Oz9g7bP1I=;
        b=GcVUSlIHelacap4kRUFGlK8KL3CDBD9tipjkh2jqohQW5mQzePRRzlLSGUoJTg6mih
         FzI23UGD/lqMN1aCli4L59FIxmPP8F91Pybas7TCWKp2RtUDknAPXGAFB2ZbOTEcnZTb
         o4OjVMxwz5BHhKUHXx1GV+JVGHY7vC0LLACnn1irVlM3FknUbx7jE9xnyTOkPnYXINFe
         HwK4ICsR4+pVQz2K2tk2AUqRkxpR55zPuaeHAqRCsDP7Afczf/ejNQ7vG30ocdTxpVUA
         zo+Z9zJL3dtgGkv3Fj5vlK//acXNt5jQKtBPCJB5CEAQ4zrp7K1piltluhuEbVdvUzjw
         C+Eg==
X-Forwarded-Encrypted: i=1; AHgh+RoB3lydQqf3oWTvy1z7zPrX+2H5JgqKCJCDjIla7+Qb3IM7pCt/VgXb5FXRHBstyhau9o17EdoqMc0EFGNb4Uc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFFn4OTQUHAs44cs+QbY26jTcG2Ebu8q5tYAIz1U47rTKQSPaN
	TqZdb0JeGSt6BnA2G2l5u6iQgtQQz1fxUSPdGXC5gAfVkRoXx+RFnmn+i94vVl7KDyE=
X-Gm-Gg: AfdE7clrz9m/Oh1nRJTHMsa2esBAQbf9WmeacJ/B9LfFib0fb5ijg5CcJNBjtIkW8i4
	zEuW+cxm4pffXDuyTCYwqPlb0bPbXb1LYlojLLms9GUpE+6myiE7eRw4X97xufN2L3YdHI5WeoA
	qYC6aUl9tUf1JYl7YBTrRFWsS27k4zSafTktf15PNbmhzHvOk5kVKrAjw2y7SlaHwkwhctTfZQ2
	kajhBKT6pyuqRoSe3BcnzS/qqlMWISRPEhe6DOcrL+GeSkxcAb+ELaVm1CfRvAk/dtYg8NuxFjX
	pe0/q0RMBatGH1wrjpMi+9ts9TFO1sbCFTKbI/02lhlu+7MJ0763lCqXOssH+ooauE3LsxW1JQ8
	gtk+bi2rOz0oWalCCiJVjdHodQPGVMFoq5DJ1FbovsLy5tdMSzOUDX5YK1zm8b4fDmDYt8rmahs
	RPmN5aFF3pgWyX5e9aJJU0G2UkpVebjHsatsyY5Zk0Ckl8Yw6KbfrR4ykc7X+9vF+4095b0H9oc
	jHPBfTI6rPkekA=
X-Received: by 2002:a05:6000:250d:b0:477:80fa:f474 with SMTP id ffacd0b85a97d-47df076bed7mr8665982f8f.38.1783616414070;
        Thu, 09 Jul 2026 10:00:14 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9de1e785sm52656885f8f.8.2026.07.09.10.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:13 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 09/23] mfd: Drop unused assignment of platform_device_id driver data
Date: Thu,  9 Jul 2026 18:58:28 +0200
Message-ID:  <8f219a01ab8fb705f3da3b2bff4b1228d657b3c0.1783615311.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1375; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=qaHMCDQ0wnCBevuvFZFgR8vFowOppWXNbsk1WmPicyU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9NHV5ayzaHMTRxZ1vJcj2e0Qsq0ixb99y703 8QmdWEAqi6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TRwAKCRCPgPtYfRL+ TngzB/9bn2VMOHKirYtFbVdvBGptXo3gP9q/1WjUMgg4jlikAF1mRjg2ik2hDfikend7CJM91ve q70Q/wAGS47iHurBLAuL5F9ByDCPX5cWQGQ4kDEBvqebOSC3WBIx483iad/iTQpqONljRVR7PN5 /cZ50Aun/PhGW+qYbIMVb+bDaQSwfjkaplQw0OF5a8YU+wafd6KpidbAK/81W34gpJCoJw8lOoW sYNr6M2uqqwt2Z0ROgI4YbPy4dkgDod6o/lgn8xfxOUcKLmGejaeY/3cKKEweD5tsSdG6jEnCxp 7W4F1KeRPdtXTR64Zj0tvpKocYUOp2Vk/2RBeyy6ZbGr/H15
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop these
unused assignments

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index e253c753beb6..a933cb936da6 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -375,7 +375,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME, 0 },
+	{ DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index ea1d039477e3..7987583afc60 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -429,7 +429,7 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397", 0 },
+	{ "mt6397" },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
-- 
2.55.0.11.g153666a7d9bb

