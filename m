Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786AF377
	for <chrome-platform@lists.linux.dev>; Fri, 12 Jan 2024 00:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bc58Ddfl"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6daf9d5f111so4491718b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 11 Jan 2024 16:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705019832; x=1705624632; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g6WPjrPY8sFDDNJtX2ESYEaz78JA5oWqN+PplwYcMfw=;
        b=Bc58DdflnKVidy1qAuK+PFDQLIxKDUktG0q76frcZaNtCOazHiHgN6+cvJyNVTJUcZ
         Mj8lBZBKzPjJXdqhMwfJZYk0l83qa4B/8zUj/oP4Dp6wkttgXLCWlu3htqKDTbUZnjgU
         LTnrs+Gf9kxWhToCud6U5GHHxB45dRJO+27Sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705019832; x=1705624632;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6WPjrPY8sFDDNJtX2ESYEaz78JA5oWqN+PplwYcMfw=;
        b=b94rIFxaxmcggAUWRFqVIoBlUoWJAL5vi7MgLKKuBIcNWVh/GytNnEqCw4RaCUV4Pz
         8xUZRFhuaxP4Uj9/fS3DkeE3OKAmLRl3VFY+VefFB69GUqXvqhGNKBufVXjHWLkhNeLV
         ROWxQNKW7BEQPVJFx5EhIqqRySP2C5doJO4m6wg6Xg5vtj1cLpOC8XVNOhhTmWa887kK
         n9Vcvdc3X9w+fnvL9r3q0PwaLYRw+StVlftzF7VvtngDoXNx/oSQdCBVWmjdICuBPiw5
         O9lS9uMVdGiD9XtYFAnPOBFENqAa50GI4dk/kJ7pMf2sm90cmJnGxTDB6NkVSoDLgSG8
         oM3g==
X-Gm-Message-State: AOJu0Yxv2R8SuScvvqOCLu+z5PKZ6GsK8OA4ITQrkdg6hN7FVQycuh6B
	kD6+MnJWSalO4OLoqw/tcIZ8abdZLK4V
X-Google-Smtp-Source: AGHT+IEFme88khQtS//8rogiv+/CCsFZHwy6qLQAGqTm7PiF2FR5LbGzAH15zmoHBxoWMFakNdReHg==
X-Received: by 2002:a05:6a00:14c9:b0:6d9:b112:ef85 with SMTP id w9-20020a056a0014c900b006d9b112ef85mr176405pfu.48.1705019831763;
        Thu, 11 Jan 2024 16:37:11 -0800 (PST)
Received: from localhost ([2620:15c:9d:2:70e4:ce9:9cc2:b930])
        by smtp.gmail.com with UTF8SMTPSA id p22-20020aa78616000000b006d998c11eddsm1845626pfn.62.2024.01.11.16.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 16:37:11 -0800 (PST)
Date: Thu, 11 Jan 2024 16:37:10 -0800
From: Brian Norris <briannorris@chromium.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] firmware: coreboot: Generate modalias uevent for
 devices
Message-ID: <ZaCJWfIUHYKHcu4v@google.com>
References: <20240111151226.842603-1-nfraprado@collabora.com>
 <20240111151226.842603-2-nfraprado@collabora.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240111151226.842603-2-nfraprado@collabora.com>

It would have been nice to get the whole series, or at least direct to
all the same mailing lists -- specifically, chrome-platform@lists.linux.dev

But I found the whole thing eventually.

On Thu, Jan 11, 2024 at 12:11:46PM -0300, Nícolas F. R. A. Prado wrote:
> Generate a modalias uevent for devices in the coreboot bus to allow
> userspace to automatically load the corresponding modules.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Acked-by: Brian Norris <briannorris@chromium.org>
