Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DFB1B86C7
	for <chrome-platform@lists.linux.dev>; Mon, 29 Jun 2026 02:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782700925; cv=none; b=bnfv+LIc1ms704O1OUtLhE8wBDH8/y/xEOSlExXLp9o9qsmJTp2zgMF9jiuTRPCWKRDjDQIst2y1kmvfaCHvYvNDI3Ou6aefIXwlISccoCF/+CbhO9hHJt0lKzMJlOxIuZyhGTvJNufGzcNq6vE/vMvkSuSK9lbflNSahHMn+AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782700925; c=relaxed/simple;
	bh=hNRhtVUd474pUYfaQpKAnz0dtx9KJoVpaCIOGz2psJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVH/rC3SiLdpV4bUX0YDdoEe45JM/ecGsR7psk7miXcDU9mIoLrydeUQtFjk+L+/OKTiVMFl3JjHuKhWFpdRtwYdtJdbUqkkjMbZ/ft7lc3L/58Wg0OzfDAiWlR1/BibEVuPIHzwH2fjscB2MIcIAZDAke//E2xTN3eiGi7Y3Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hu2zXru4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hu2zXru4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FDF1F000E9;
	Mon, 29 Jun 2026 02:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782700924;
	bh=5Nirkso87d/VCTrmXJLfJ1esj9J7KvN6wJ4+54pc11A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hu2zXru4SpkrghM7L1Ed5g4HptqDXdOuvCi9XoOCw0HwHNB8kq3bAkP502UJycEIN
	 Y8eUN7LswS/UGZY4lfqlB8c+C6hXYCaSZQ4Yqu4qAEH0OStMdcmwhFPm1I3O5K0YAz
	 JcNcbhVDowviCAu86nEr+BOZVMGyDmHusLrHTJLnTixxUlD7WULxDCNeyyiX6s4yrh
	 mAIrD+NtrfDUeHPf7HTrY3uUccLUVHZF7wzDpK/GGdhrBej2Fuxm1kWdUZyZzwaxkP
	 wPlI4UGHrm41qaXWkEPYsQX7z6/kB1SFnx2Ys/yfJt2XKLrNQfNV3qYt3C1nJnckur
	 HFaZcuW3/JdUA==
Date: Mon, 29 Jun 2026 02:42:01 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH] docs: ABI: testing: minor cleanup
Message-ID: <akHbeYDF1vcJTQh6@google.com>
References: <20260612125111.187072-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612125111.187072-2-manuelebner@mailbox.org>

On Fri, Jun 12, 2026 at 02:51:12PM +0200, Manuel Ebner wrote:
> Add missing ')'.
> 

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-firmware-next

[1/1] docs: ABI: testing: minor cleanup
      commit: dd06eb60e86a1ab6d3bd4f641100f47b6f7342b6

Thanks!
