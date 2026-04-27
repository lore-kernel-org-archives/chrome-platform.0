Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474853E7164
	for <chrome-platform@lists.linux.dev>; Mon, 27 Apr 2026 18:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316166; cv=pass; b=WqSzh0TVjRsPlT/+8VCjpok2xF1nxn5X+wQDSON9dQqmgUTLTM5qgwtFs5DztHtKjODMqBfYCdSNH5t35rxEN7uATygkZkLtCGuneGgd2ZiXUSbfOrXPKTz/8Mfbon/d+5cimX5xxT57W5BTd1Q7QHX0zv5eTqo869OHqw3kRUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316166; c=relaxed/simple;
	bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XS6e0Zg3s1h9dLDVl84YKeSNAc3/DpX0acxf51abDq5kzjmUqUyhv3+hdBBtUA5fpqDOR0H7jLlOqCImk5ejqoUIqlBCjL/lRg9IClLp0CLEtK8dFUUg8wWn4loYFnuAux+g4BMZxKKMLMERcxJjoFJhTf641mM4jIRdTCbtX/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jj1MuY4x; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jj1MuY4x"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891ad5c074so21685e9.0
        for <chrome-platform@lists.linux.dev>; Mon, 27 Apr 2026 11:56:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777316164; cv=none;
        d=google.com; s=arc-20240605;
        b=J0OULVT7yXK5P/qUbGGpucwjS/g5otIp8ap52COSRA5Vr6tc9etN9JcHMwO+JoGGct
         Tx2cyBIFw0o6DXcRXdbzRN2YHQUDx96RgPeenqRHW5UOrGmsqa9QB7LrIBH0H8Ds0w18
         q+2g8L5/ZHGPj5QaWLtESU2Drp36MFjmvi0sSzGLVH/F0xAnOp39qCTr0l1Uef71jDvG
         /SkWAvTaIDNlKLYtANNxydMKtaydyLsVC+JrXS0Ii/t+nPmdQasmPCojOtjG6vrw+K+L
         TiE4RROHkH/UlKB4LEVTvpR8/bezpzZHdFFaRg6yTumgMFcctAQD3i4NA6MoGLXg1Reb
         8x9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        fh=FOssTjM1pagetU2CxrKzrEu3QzEJPT7H81kDEpPQ5s8=;
        b=P3NSFf84jgDUeB2jwPZ+QbLAZRmzkpJnr/YoPkX5nUmr58GFfcJxXhRfKsunl72NgA
         K1EnbzUiz7pTqfCuwM7htskbJRJKR1jEjXXFW0EuJjAVKLvWiwrPCgZq+NMs80xU06v0
         pzznrDiQ832RVu1vtplSM1X7ElHNVn9BP3hP/jqW50ducjPKhBkg8H3eHxnFkgbLJamO
         MXlhbxSkiqBZNTkurACU4p2+ZJYD3hubOgrCNvDkFQaZCto3zbFkae3RqA+b411e6LK0
         jd006MBj0SpipofOl9P/MOuFF5ZWgGXI56cmA13olE33VVmF2pVbeFqlrN53wXz9n3e9
         K25g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777316164; x=1777920964; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=jj1MuY4xktEalOX3zYSGmTxBo1hQzJohrpocDnGMdJ48nsFFv5uGhXjkLHEAuGPK7P
         MUNywxKGIMb3/rceJogademUiLu44vaHflxlqmdOYihcNB+yEvofKnGiFM/t0bwWssu9
         WETVUKx8kgmQ7EyP+S5AEmdP/bE+1xtDtUomE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777316164; x=1777920964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=ENdmZCA3wqn6zqqPiHEJybprYN02TPdiZq4yHMXGyxR9GqTJ1G9PSx67xGJex9lYl0
         JsQLRtG2johPx3c1hLwJCnuYY9x7I7CzYeEcNYAT2sakzQ0j0gHbuzVU3owltt0DoS8V
         bbIF73uYDZ2ScGS2Y/863vjcIwAG+As3KwYZ5bOHbFBqDUVPSP1hNmklc0PHKsk8hBlq
         3irUZHYlDfV8IXdfAVn/dENPjfSPZfRjCQLvJ0MR2F6A4Waqy5m9HJsW7sMqceFt0w3i
         UkmafjWqEp6OFB5CU4dMX0zxGOJiFDopRtbiTy/LUQGQojlhVNHBiwn2SFobjUGvMw9F
         QpsQ==
X-Forwarded-Encrypted: i=1; AFNElJ89fqtKYAG6820LHVsviUjXys6wd062mTwycUE47bGPDARhL3wdkAISyTwbxzaGQGPyN/MXldEW6SBCbPjdDK4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7ODhswar42S3aSAoSp42yWvJcrjinn49xEUjfAbcuINP7h625
	oycVfUz9g33uq4EchG6YGHPfLOVBFEaYSp5FxPr/cT9DehQCxiupoegALewmas7KW6NogcJDMsb
	TDoz0G1+G93CeTJpFFdwioxPwSvikD208gSjhrdhm
X-Gm-Gg: AeBDiesw8QOPVCEpEBHz+tw5Sltx2rfYVuxZu4UOBh2YWV+rWqW60pKl30lEwcZcjWR
	DdsB05NaThVeIvkXfIF8TorWhCtRBjkqacoO6LlFRpx0j+EPiHZ4hTMQOZ9S//aMSBhVc2lBMdJ
	hppsHQDnqzyhWofaKmuTKaoF56q/5HtwzlFinFPjbKEoYQC0rhDW+6DE7KpWVn5OmmCGtsm2KCC
	jvAQ61rBoAeo/sh3KK4NIihuLTxRS+zVp0rZ4dL0E3VKZhuc7Fb12zQjn293FevR1rEdrOb86bA
	VVNHThHiHnbiIu+dKS3RVTKlfxZp9ztqHdqI
X-Received: by 2002:a7b:c311:0:b0:48a:5980:db10 with SMTP id
 5b1f17b1804b1-48a774cc1f8mr96355e9.13.1777316163233; Mon, 27 Apr 2026
 11:56:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260426214739.117131-1-titouan.ameline@gmail.com>
In-Reply-To: <20260426214739.117131-1-titouan.ameline@gmail.com>
From: Julius Werner <jwerner@chromium.org>
Date: Mon, 27 Apr 2026 11:55:51 -0700
X-Gm-Features: AVHnY4JUnhdT68s_METnIA5QSV3ut8KRpYX49wB6CWXMAzopd7pcCjTVeqn_6sE
Message-ID: <CAODwPW_N-ARU21zd57OhyUH6qCbC5AE67nFhT7AuwO9RFFEJ0w@mail.gmail.com>
Subject: Re: [PATCH] firmware: google: add bounds checks in coreboot_table_populate()
To: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
Cc: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Julius Werner <jwerner@chromium.org>
