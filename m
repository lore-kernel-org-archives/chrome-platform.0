Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD2E387346
	for <chrome-platform@lists.linux.dev>; Mon, 12 Oct 2026 21:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791839864; cv=none; b=QoCx8W9I7kDFkhqZOkBbT+XcHUrAO3XVdNRNL7ScaHWst4nHKazZn7CQv6BPFQuIq1Qxh/5cZDnBd/+vc+Bop7E2oHtJvAh0CHNSOUAxDqMBrTlgGgTo/IT11fkWYzq5tq409zjRx1LAc03RUPhJ4aybIQwgoeWW8A4g0cef9fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791839864; c=relaxed/simple;
	bh=ZOaV5j+eXuFSiRY/48xGC3VEaW0+/0IwPIwLqoa+0WA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PnuqUczjSuOIV0JBUMhDwl9VXNFptbXT+c7+xVDCUI3O3rKmlmWSxzqrkq+7WBQKcrlpTuu2H/GPm5PySViN/Uei9Jt9rEhGKW2DfzZGMhpWnTSt+Ko4LNEijzKQt419eTcfqNAYLYzWy0b6mYDo3sUtq9+Q8bQMuk6pB0WWuS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjRGbKno; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjRGbKno"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35834f72d94so3997404eec.0
        for <chrome-platform@lists.linux.dev>; Mon, 12 Oct 2026 14:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839863; x=1792444663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZOaV5j+eXuFSiRY/48xGC3VEaW0+/0IwPIwLqoa+0WA=;
        b=BjRGbKnouKIe+b0S/CWiEixTV8dl6eVq3eSajY7AXRQUCnR2ToM1ItD3Rl1Bn31D+h
         LQB7XWMpTYfB8FFIDBnHBrv8/rvvDj21VGfRAAVDuC6GA/jyBgxM+KQTTWGOf5Gzvgt3
         cDrztSUTyKWeWtZ9E/0jt/yNIDs7t2PHaJzzQIgDeJOvvU9y9N/5ssQjUUYReoFpnyfh
         mIDrxUtMEwe+gQ2ISTVf0T2u+blpMbj1/45Upl8i3JvOM3VjWXWilVUFPPEeqiLoBM7B
         1jxFjQSGgKeqV23HtDNXAJjLgC8osSYPDVLKBPAPWXvU5Jft6d6oMTg78sz8ANVORoNE
         Qg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839863; x=1792444663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZOaV5j+eXuFSiRY/48xGC3VEaW0+/0IwPIwLqoa+0WA=;
        b=QoLFFGfUpiG8kb2g7ZLuiZ0X5ORcL96ZdXYujHQ2iQ6UIIU6xIWot8Yyp0pjCvuJC0
         tN5DLKa8lw5JjT4Sq2PU3w1VRE2j1EHUBWwWb+O22LxgTaHK2ycWmAjzrBZQTzQJEDsG
         2f34UHDMzO6zWly3n+rVRxqpyNMoEXA80WngMJX3L+ioid2Y9QCFvDKO8os8fXdr5ddV
         0MkWL2t8DmVr9P7JxMsZKw8wIBUtYloyz0eVPACfByVN+IK8toPU87f6l8owNXSryO2g
         9hrNQMA6Khdp7YxdGr+Fx5i7MF5gl67jyj1OxGlKZWl+CZfCzG/l575xdmBEvrPRvNoE
         L42w==
X-Forwarded-Encrypted: i=1; AKwUvBxENE7f2lSQkB/FEAZfsLUjEj6p+UCPnYf+x1egnLGMYnHKaUYQh3DtbAKUtruimxV+SGJtKHs0fo/GiLSkzCY=@lists.linux.dev
X-Gm-Message-State: AFq9FYI9cLToFRiFiejyijQvBUqkqzlB2sE9mb6oQmrRy6BPH5E/L/2N
	4EMW7jPzPnHBbJhNFsrNMvSlQWdMaMqPgOTE/mu5hM2Bz7eFw6ieX+nD
X-Gm-Gg: AYBFou0PdiB22cOpgFOS0w1gsYY0jvLAQZt7A2QadO9yzUCVhzAXE9rIXRClrMlLQyO
	wkxnnW75SneprmcbrYkkaSIeYw24SEQvisY+AtZOHh24ByD+3asrsA0tWg/RWS2zNHGgTaqnGQw
	3l+e3UWRNtiQ+kWYsy8zG4a+nVK51gV5BPUBgtUNCbxaHpftFJzVq+0NRorHj3JnPUQDCr40XNV
	4nS7EWE8hRD0RBzdHie9Fw43BGljdMlER0q8Ol41ZiGWnVCM0zH7mPzEtwFyrb+lzhw4x2XDkgu
	Qf1SxS2inrTLq5Bo+FvY8N/J7Jva5zhwZr7WXhRggW1KijM0QzwooalsZ9UGKLxGCJBkLzHbxmW
	DrctMNiHctXOzL/lj7P1t4OeH7JdFysHfZflEWTtEu81vN+gisqhHKHkP878qsIwx40vT3Km95N
	aNAkHaOYbIhMa3bYhlGcdxq1YUWiGU8UQfNlHcMbwFDZsJDcwLFS8HeW3967CLCJpKoFk27MTPT
	e99pb40Jrszp1bXph6sNMgsxoBUKktndpBv08Nl5hxhm+oXXYCD1Zw7WStu+f8Le1DQVHYH3TbZ
	HS+RDV+QgCuPpoaCOdOzSUZiY9gTPg==
X-Received: by 2002:a05:7300:8245:b0:35a:7464:6159 with SMTP id 5a478bee46e88-35a74646242mr5454876eec.34.1791839862310;
        Mon, 12 Oct 2026 14:17:42 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e02asm39147488eec.27.2026.10.12.14.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:17:41 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Arnav Kapoor <kapoorarnav43@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: common: cros_ec_sensors: use sensor_scale union member for CALIBSCALE
Date: Tue, 13 Oct 2026 02:47:30 +0530
Message-ID: <20261012211733.575305-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011191641.4e9e2ac4@systembl0wer>
References: <20261011045410.356156-1-kapoorarnav43@gmail.com> <20261011191641.4e9e2ac4@systembl0wer>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 11 Oct 2026 19:16:41 +0200, Joshua Crofts wrote:
> Please add a Fixes tag. Otherwise looks good to me!
>
> Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

Thanks for the review. The mismatch was introduced when CALIBSCALE
support was added:

Fixes: ed1f2e85da79 ("iio: cros_ec: Add calibscale for 3d MEMS")

Jonathan, could you pick this up when applying, or would you prefer a v2?

Thanks,
Arnav
