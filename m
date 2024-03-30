Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E50742054
	for <chrome-platform@lists.linux.dev>; Sat, 30 Mar 2024 19:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711828199; cv=none; b=gTe09/gzXslnChWmUFZpE1Qjt7ZSvu4CVaBAPGuk/I6mRz0INBEzXC4l53M515BkGrm0A/VvL0BgmIxg9BYctek9GN/r3dRGZJ1m/Cc+q/0oUjr9yU7A9ZMEFwi5IgL3pCLJsX/IC8myNRrrXlwBYv0AwiaGFpHlLCS0ynJHycM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711828199; c=relaxed/simple;
	bh=v3LCWHdD6COiKx5GT1EpzgxmaPTkJTQwaRwt2hz8Q4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fIXL+kLtZK9diQpqComKGf+JzFIIx0Zm8XApq0WC+OcW/cexDvCart5q6lGb0RVJq8xeT2/b9bUYcMluc7bUu0oq8c/m2dpJDw6Nu/UITCXMT1pUMlexgduDHpwyVabCtt0jynK8VuyZ2pXZE13GCKNwj1wQEN1ozEFkGN+I8+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dX6mkcWf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dX6mkcWf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4154d24cc77so12077715e9.3
        for <chrome-platform@lists.linux.dev>; Sat, 30 Mar 2024 12:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711828196; x=1712432996; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IsNJgKamHqNuLGNVWu9ddLUl1Ncqtm7rSn5kGPjfhAg=;
        b=dX6mkcWfokJyyMIURl2+9GXyBkOoTUv+DDO8KLrPdORptWOfxCzfTT5F6xw4nrSxSV
         IZWrnae2JUKKta7s+fNdyVuOAwNXX0rGudnJa+Tei6MgoxuDL73jIBOSyAdC8/F1xK8p
         Kj6TeSYO/Hye/CTVfaV22OA/zzd//Zt6ckZI+hp7zbE16YSCUKPipwUUsOWND8L2IzF9
         yXTE0m3qmp5VJdjRqv2t41pUB4TgL7U35MIVS1Bxkwn+sxkvoMTOUX2btB9GkWaEkPYJ
         es8YnJ/utuxJdCFgnNghbXR3P+/yOG4eRNoShIdqt8TJGwWSr1OxhfqMSVPyp4Keu/tw
         wk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711828196; x=1712432996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IsNJgKamHqNuLGNVWu9ddLUl1Ncqtm7rSn5kGPjfhAg=;
        b=PBPFlytAnS5sNEsEagU4baXrsb+rLaqTwVSihhJJzLEWCZJQZAQWC9RwSZbTpkjDAX
         pNyyyanZYQrqkb20jrkBbAgpT9QMgeCSmsN8zGWtiNG0PkJnPF2zci11YBdRqHNHOedr
         4Yh8IadnYTWFlixnJshrbqKIcd/NQApmwCu84Nfy7b65/l4T3TT+OypdXqTRnZGalVxt
         9n8PuZKhgZLSIt5IVazNEuUZx42VPDYP3Vq7NdiOvFuXYF9iPhte4nhN1TFYCrfrHY8e
         UqLL3pUQUr7L7FxmB0qYcTkGQtkDbm3b3dI9dytshrrMfCG6RqUMnxnl7iF4qJfAcugL
         c/MA==
X-Gm-Message-State: AOJu0YwMqLFESILkL9UR7Zw50gV7W0O9brKRjrzzDIzmmaJU9wiCav7g
	e5PW8krNGcjJ73x1srMbWJEKs3f2cfC5xL6zBZM8kl71xAN1i/QGMjWgsA+4sEr4UsPMcaKlgyV
	m
X-Google-Smtp-Source: AGHT+IH0guaC7prUM+RXr7HbqGAqDBBwq69TcKrnmar0p1wAyp/wJrBQZNUBYBffmmIT+Wrf7xWoRg==
X-Received: by 2002:a7b:c408:0:b0:414:66d:db7f with SMTP id k8-20020a7bc408000000b00414066ddb7fmr4569506wmi.10.1711828196656;
        Sat, 30 Mar 2024 12:49:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c450e00b004148b9272a7sm9571616wmo.0.2024.03.30.12.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 12:49:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 20:49:48 +0100
Subject: [PATCH 2/2] firmware: google: cbmem: drop driver owner
 initialization
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-module-owner-coreboot-v1-2-ddba098b6dcf@linaro.org>
References: <20240330-module-owner-coreboot-v1-0-ddba098b6dcf@linaro.org>
In-Reply-To: <20240330-module-owner-coreboot-v1-0-ddba098b6dcf@linaro.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>, 
 Brian Norris <briannorris@chromium.org>, 
 Julius Werner <jwerner@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=680;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=v3LCWHdD6COiKx5GT1EpzgxmaPTkJTQwaRwt2hz8Q4w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCGzfNRl5IuxePlMuY5U33wD5kTny95qVok2oN
 0L21+F7fUeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZghs3wAKCRDBN2bmhouD
 11WuD/0S022EzzJMKz4FhiEqd1VIJULYBr0mqEFtt0/IGU/WlxdkuvFrYU3zO81ZpV2lAkqDAW6
 /lrpmMotoGu6Vng8BQJp4j6YjTjg86LRu6Ikh0WVfj1ERINztCMxCeudLqVdA5Msj9/r4iZTsuS
 IoPyZ42ryJ8aaCsQ006ZTxrqqsV0wY5LHUihrgdNvAP95UMq5Lg368n8WkMSpg8OuK2N9xrdsPK
 P86oqq7CBULlpmHJ5cOTjiRHVAA5oTgV/uCygrsMQDLuwmec4lLMPvEHw7ylFsZqmesz2ZXqItm
 hiA5UpM7orfPLZUhxva0nHHThwdW5kwajm7jh1qDG1eJoXJaDsJQWdOGrNKcRSs12VayXjEo3/o
 /FQPyeA48qigx8SiLgQo7KvUj2y1NvfCrDmtyCznNIFiMuNSr6OjMjwmal6hWD+qHA+e44SYmAT
 yonEaUTu8AtJSdcPrS2fJLhTFKneWqGIoNS7ALi+aM2rutak+D8/VMui5MB3QGf3B5egps9HytD
 YDYvSJfasGXmc4JYAbBncBf6R7y/xDyS1+pc23r6+ulMq8E2O9UgkTjElb4mhomxEc7hPTp+kF7
 P/1DSYezjq6QOTTDqHLyrhL/mDx05rppzxvAPVcjFO5ejq/sO05VWkZuRtycr8pqDgdGwY8+MRg
 +LLhsYJGTBAe3lw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Core in coreboot_driver_register() already sets the .owner, so driver
does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/firmware/google/cbmem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/firmware/google/cbmem.c b/drivers/firmware/google/cbmem.c
index c2bffdc352a3..6f810d720f4d 100644
--- a/drivers/firmware/google/cbmem.c
+++ b/drivers/firmware/google/cbmem.c
@@ -124,7 +124,6 @@ static struct coreboot_driver cbmem_entry_driver = {
 	.probe = cbmem_entry_probe,
 	.drv = {
 		.name = "cbmem",
-		.owner = THIS_MODULE,
 		.dev_groups = dev_groups,
 	},
 	.id_table = cbmem_ids,

-- 
2.34.1

