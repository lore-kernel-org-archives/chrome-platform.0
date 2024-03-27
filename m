Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE6D381C8
	for <chrome-platform@lists.linux.dev>; Wed, 27 Mar 2024 07:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525511; cv=none; b=bNKID9zhzTQuDXeqPykXHUW2vN+mtfmR3UrxIMOSga9FON+WgCIN/5IdYplpRSdjmx65yORU/WiA8IjN/Wnbk7SAjhRR44qJgJ719ivhILZfR7MGIbemJRSx7/H/u0wTr/djdLZexVC0Wce484NqAkffUKJaAMKVEY9pvMCZg+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525511; c=relaxed/simple;
	bh=4icp/wvd/fjEray5B1/3YlXzzTUAdRig+Gb04+Lw4sw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AOXvyrITjp8k02uc0s7Im8o3WImf2sM3LH+ge16nGl6Y3WSwQa8bVnb7Q4GUc7lYY3VT5ecTLtf9WOnkCjB4G9iFDqr+gHYubbOcFyLhK/rSPzQL3ouwRu/Wnpqo8sLidQF4yAxYYR6zVPGesEBcFe4tTxRa4YcCgDxIUQ/9uC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lGJTDr8g; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lGJTDr8g"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a46ea03c2a5so107719366b.1
        for <chrome-platform@lists.linux.dev>; Wed, 27 Mar 2024 00:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711525508; x=1712130308; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hd27sV9Cq/PUsPevWdVtGWA5/5nRhufdhobvGmInTo=;
        b=lGJTDr8goQVq7Moq/d4K39vuuwKFtR09pRimjSr2V64jBvAuAnnRlwrFpduSI5dzas
         +U290a5WFcybRzPGVBcaewgNmGpAi+l5MuEnGGjBMXiwV017qaFkru0ymHGgj+Dm9isz
         PUTDn/FEKmrjVqbbyWQnicoSjamm+bW5sI0i/75apP3WVHUtnypytON+1p3GP7BMU23+
         lGXUeTMZ++tOUU3tJrdREN5+6wjurLU/g5cagoVldXQVYOVEXPrTZpL8Iqpqiqk6bxWk
         Cfuih1JHyd/EqB0pmRC8AUMPI3NwGvpkny3iH4LPx5rfkgAhIgr44CeAxK0HJkqN9zS8
         aJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711525508; x=1712130308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hd27sV9Cq/PUsPevWdVtGWA5/5nRhufdhobvGmInTo=;
        b=hlhRFZAN7m8cIt0vpHb9LItnF3++xkZcdYq3lAU7SWcz7rsikrPwES8gcOEeGJd5px
         ZG5zWs0Kh9l7SJDGslILV/sbnSQDcqfNqshzFq7M0AQUGRPGcf9l4fkGERagt7kXtIzQ
         2Pb2sxFlt3v3k/upUICvwppEAmA40qyvGI0Oe8DZxzv+rnHW5pKdmbbDEns95bO4Y9I5
         lcIpnc3J+U26Rd0R9XhlBqlkWyILtZDjdam433gsqLlb7MaF2SviuYnTeMpNki+nrlkx
         SD7dZHrwnG8Hn5fJtdxmPMlBt4N8fUfzvEFCzInQmzMPfzrmZ1ROnSR/oz/zvW1XuEd9
         C12w==
X-Forwarded-Encrypted: i=1; AJvYcCWYGrOqctJqKV5sp41bpkuEVFugXq+oIoFfPzi+Lx5ZKMzmCmNnrAzTMaK8VUhJlO20+DXEFJbWcAURm+TJD7Vtm4yQRglAtVIBmV83GPz2
X-Gm-Message-State: AOJu0Yyf2ruorIP2ZUz9/QBURm9zlG+u4SRKxhR/bMZsxvXj3zIN7pb5
	eeoCKvCXdDVj4Q8MatruITJKhmahTF6R1J7Rdjg3uaGzeIgYKxahcKaW9FAUY/0=
X-Google-Smtp-Source: AGHT+IF5Vmj6eTyDBK1fEXaF+vjY69cFdRk1hmkzgjV+20lhxomGlD3ZVF+CyF41sRnpLluZYT0dNQ==
X-Received: by 2002:a17:907:970a:b0:a46:d759:d531 with SMTP id jg10-20020a170907970a00b00a46d759d531mr3840452ejc.34.1711525508119;
        Wed, 27 Mar 2024 00:45:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id am11-20020a170906568b00b00a474690a946sm4671745ejc.48.2024.03.27.00.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 00:45:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 08:43:52 +0100
Subject: [PATCH 05/19] platform: asus-laptop: drop owner assignment
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-b4-module-owner-acpi-v1-5-725241a2d224@linaro.org>
References: <20240327-b4-module-owner-acpi-v1-0-725241a2d224@linaro.org>
In-Reply-To: <20240327-b4-module-owner-acpi-v1-0-725241a2d224@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, 
 Daniel Oliveira Nascimento <don@syst.com.br>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Matan Ziv-Av <matan@svgalib.org>, Mattia Dongili <malattia@linux.it>, 
 Azael Avalos <coproscefalo@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, Jeff Sipek <jsipek@vmware.com>, 
 Ajay Kaher <akaher@vmware.com>, Alexey Makhalov <amakhalov@vmware.com>, 
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 acpica-devel@lists.linux.dev, linux-input@vger.kernel.org, 
 netdev@vger.kernel.org, chrome-platform@lists.linux.dev, 
 platform-driver-x86@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=768;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=4icp/wvd/fjEray5B1/3YlXzzTUAdRig+Gb04+Lw4sw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmA85PAnzGtbUajfFNHmhOq2+9nktaOOh/LAtXL
 bMT1S6F6y6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgPOTwAKCRDBN2bmhouD
 14vfD/0U+qsam3B01jMhQjU7MHwc7lkh6KqJUj8kIkPKUTlilSmzTtqi/YPPO25PNvZih7ChIV4
 0FUVQLtz1FzDFpbzhZC+Ff8hXstpTGbxOFmwN+uQoRl7DqDN6nBL4fwD/MwHFVg1FbHWWKuAV4h
 wivgLsyDHVrp27oR/YeG+2jMkcUGVgD3Bcw8ugJK4Zrw5T2NoPzgO0+pvp7SJ5Wpga2HTmT+rzV
 Z1spbCkt6iW5AkIMgOYNt3wWhDu4lntluDpmvOyAwZQmVT1/AOUGdQOJvPDOC9lY8IHENX/+man
 7GOciwpHpbMTtdMGri5Q+jjm33DuyZqJqQ8U5cUUzNmsRND4NqIDRIidpul/EwDFID6gcEkxlZu
 8/LXVcbuP3z/2vmJimjK15dCTrybmwnHZR12op0/WkEKoTjSN0SqXBAoElpNXi0tP4k6jXGf8jo
 CAZeFps5EXzUvZiJeG24MqgyL7vuN4DLwSFqWlaOxqLPO+bX8tmOIbfoYz3yYS6Hgr7PI3vSkDZ
 reXjPE0xC201KOokJbB0evZtiGyU70ieFbaD5xG+EJS56k97D7HkCJhfTBzv0W9MecrG3l7n0kE
 YANG9mPwlPFO3aJ52nCjlD7oVmbR7+wYVR4oLAdZeG72QSp36DxAuch2nnTp2oGUoQk8peJbZpP
 7Wo0/UrvVk+xQaQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

ACPI bus core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/platform/x86/asus-laptop.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index bf03ea1b1274..78c42767295a 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1925,7 +1925,6 @@ MODULE_DEVICE_TABLE(acpi, asus_device_ids);
 static struct acpi_driver asus_acpi_driver = {
 	.name = ASUS_LAPTOP_NAME,
 	.class = ASUS_LAPTOP_CLASS,
-	.owner = THIS_MODULE,
 	.ids = asus_device_ids,
 	.flags = ACPI_DRIVER_ALL_NOTIFY_EVENTS,
 	.ops = {

-- 
2.34.1

