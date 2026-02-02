Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11932727F3
	for <chrome-platform@lists.linux.dev>; Mon,  2 Feb 2026 10:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026790; cv=none; b=Yq6P6aLFAgpJa6YvwlOP7xHBRzMnaMXxDOPivugDJ3Obpnk2upmbJ9JlvbatUYYXNRxdD1jNTl4e+SvngO1pcyhSjwrgS4+a3iNMyWtTqV6y6e3LivBsWorpgUX3l9qsmwXi2haYeG458JhmjbDT3hIfoWaOQfm0D0UApu7dEIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026790; c=relaxed/simple;
	bh=SIKNYUbtclxxsYiswiKvL+F1a7IRNxJp1g333C8aNV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fLN0+zLCwlq46gymBglEh2kUs3K/RLIdfBsI4GI1Z5GMRMStLjQnB6UQ6Ubeed+edFUFAIO5kkzRI5DVoiVgK+J2twkFPXaGncUVt0a+Bz7GKzKhwmR7nRheawkws2n6diTEtdq7zNd5iZgVPNgla2sTdWFuoImllyhHptLvhbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZQbpGHIo; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZQbpGHIo"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b729f4c154so182544eec.0
        for <chrome-platform@lists.linux.dev>; Mon, 02 Feb 2026 02:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770026788; x=1770631588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pYRS8REiJkUFBo0hIRmfjiKWM6qxlJroPIpVwsxgx/g=;
        b=ZQbpGHIow3RsTfRQpx8QSZayCTKXm4HiQTDlICXtIuW0u7LwjVrJdFc8SASM0Z3TOu
         SlOcGC80dNl47epzlhTag0I93H9+bj9jiHXzxEW8vGU8MDCuHw6i/TK6g0rH5HEd3PP/
         NWVmvdRdx/eouJHWOCxuY63B6f7KIDpdpLXKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026788; x=1770631588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYRS8REiJkUFBo0hIRmfjiKWM6qxlJroPIpVwsxgx/g=;
        b=MeUdTVHxX95G9wMM4XDINoOJjgHa+jHx470GJtCngh6ZQmTJbzKUJJlPXk4V/NFR6n
         DfUSGRAyaluivperxYmKm5f1C8Nauzb2iaMbGi4ESkedAC9KMt3pJSQe71w6xfd7BJBa
         mrd6XM0wqV7KIl8oaC+8PfnaqDzkCHBG9neraHN1ytTgmiocgdyQvVdB9gsYt5XB7ixt
         IS0xGt/CRb0A3CNkbG6cwBGCYfmMfmTusE9mICbAgjURKwBlG5D2ETuULwCS8T7G0z+w
         +uUSoF5Dkm/M8xStO0veGMzam3FO3r/8o1luiyRdx/uw3Ge7hfAJTZOYk6Y0lhGghdqK
         R23g==
X-Gm-Message-State: AOJu0Yw8LMuuJgPoTyNYzkx/1HcVzxaudQvg7daKPd2O/mwYMRSv8zGD
	UrF6datH0kxXA3UtxoO+7gpQhk4BfygsQQrejZDNUWxZNaBei8suL8hv8Nq5GOKv0L5piRiWAeK
	c+9Q=
X-Gm-Gg: AZuq6aLx6o1oMrcVMaZaiTABN9CC24ba5j9tw4r3VXvbJwF8uJyb+4H1UrJqML0B9Bh
	iedlr3BTJbUg+wO5e0nUoj25qh7ovHDREZEOM1LMAalXC0nQrORjbvHOOq7WY//0821OXwOXReq
	RssBlGGtewWpXxOBslv+7iu4tDlDxhEhrRdeeeFNRkd0KHP+0xAVRqxz4GF7Zs7pDp1XLcGXyA+
	gsKF7ZQcU+sqWfrFDEV1YK25wb8hJJf14y5UP4dd/YSpVQgctZPvfFjAZRGbNpgcO1B7doST1ZR
	QUpI4i1SWTeq2/WEsTM+Mstz66h3Jq+Tcw/uZ10N+Ts6/Tq2RvFyYQHNkjYVGxfcJdlmCde9OeC
	m24ggNuUIf9dp8/4uxybsxsKQ/4SbDUt9Raaf7mHed/HnDXuvhz3tY9/D7apNMqlTxqoZh52tmY
	IRV6N+9RGubpEQfP9Fh960Va0/c4zAXSY0o1qDl2by5Jt7P0TeNzhVnok=
X-Received: by 2002:a05:7300:4313:b0:2a4:3593:645b with SMTP id 5a478bee46e88-2b7c865023bmr3580914eec.11.1770026787840;
        Mon, 02 Feb 2026 02:06:27 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:71b8:af59:32bf:9394])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2b7a1af8ac0sm19789598eec.35.2026.02.02.02.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:06:27 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
X-Google-Original-From: Gwendal Grignou <gwendal@google.com>
To: tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	Gwendal Grignou <gwendal@google.com>
Subject: [PATCH] platform/chrome: lightbar: Fix lightbar_program_ex alignment
Date: Mon,  2 Feb 2026 02:06:21 -0800
Message-ID: <20260202100621.3608437-1-gwendal@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure sub-command of lightbar command starts with a 8bit
parameter to ensure alignment.

Fixes: 9600b8bdbfe4 ("platform/chrome: lightbar: Add support for large sequence")

Signed-off-by: Gwendal Grignou <gwendal@google.com>
---
 include/linux/platform_data/cros_ec_commands.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 144243143034..16e779daad26 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -2026,8 +2026,8 @@ struct lightbar_program {
  * EC RAM.
  */
 struct lightbar_program_ex {
-	uint16_t offset;
 	uint8_t size;
+	uint16_t offset;
 	uint8_t data[0];
 } __ec_todo_unpacked;
 
-- 
2.53.0.rc1.225.gd81095ad13-goog

