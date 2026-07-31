Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838601A0BF1
	for <chrome-platform@lists.linux.dev>; Fri, 31 Jul 2026 02:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785464679; cv=none; b=HJ7Jo/VAep+/kOgLf+7fH4JSCuuL3kQ/++KS65ZvaXJnvVPRXgnihLC8zbSH96A/plNaivQUfXK63eP53VBggyD7QC7MDCbg/Dy1z6qwz4NbMrDQTbWzjxrOH+DrL2CQ0c9c5jc9Y8K94t5O4cvEEh++IYdyz65Ns2N8pACz/JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785464679; c=relaxed/simple;
	bh=dNBcr4fb527a/a8asot6WY4OsMJd9KoUqikq93yltc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHNrMQ63XWuARNrHVrORHhJWSLTkKCQQ/32ySMKXcv9eno8OLmS7cfh7475Wh5NtT/HpBasDmuuXryJzj+bCa9VZLbAH+ve3qYAyNnBXrkJdKgf+5QcAiL/kKdNeourR3VvgCu1UQvxZG3Ta1/izhmt0BrfxQGjKEymxpdZH19k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2HMHExG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2HMHExG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993D31F000E9;
	Fri, 31 Jul 2026 02:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785464678;
	bh=CfQnqh0UfT8Fre2deVM/vLplxlHQzZlrX0h7E9ti644=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P2HMHExGd9Uv+V89hvT1TitT+9I13lqBl0ViNGwtoPCY8gvz2PAzqNflQaoq/+T/Q
	 qAewB8J67TgnI3DiRgk/m4jKeQK9PmjhC6NBUW1vM9L3sbmwBf7WcDTlElZE6hqojE
	 9MdserfQPxLVF2E0AOzuRufOPG7u/Of57uwdX91+7iIdStHWTTtOEwXCyUrVfSd9oD
	 e1W8czei4524cVEqHrMtwTfkKXiyelJQ2PKsBNCEy27HyQPlzObbiS2wsxL5qQDiae
	 QNl8oiekA+qcYRq499VThef/lxgU9WBvkztlZ0iNt++XIooLMtm9Rqi04UNQ+ieA+R
	 SYNnHQ/BtgeNw==
Date: Fri, 31 Jul 2026 02:24:35 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Alexis Savery <asavery@google.com>
Cc: chrome-platform@lists.linux.dev
Subject: Re: [PATCH v4] platform/chrome: lightbar: Limit payload to max
 packet size
Message-ID: <amwHY2HCxvdQ6qxR@google.com>
References: <20260729221459.1006-1-asavery@google.com>
 <20260730204240.2227178-1-asavery@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730204240.2227178-1-asavery@google.com>

On Thu, Jul 30, 2026 at 01:42:40PM -0700, Alexis Savery wrote:
> The LIGHTBAR_CMD_SET_PROGRAM_EX command encapsulates its payload data
> with an 8-bit size field `uint8_t size` and is natively capped by the V3
> packet bounds limit array `EC_LPC_HOST_PACKET_SIZE`. However, the driver
> currently allows the payload chunk to bypass this protocol limit if the
> SPI transmission layer negotiates a larger physical `max_request`.
> 
> When this occurs, large payloads (e.g., >255 bytes) integer wrap the
> 8-bit size variable when assigning `param->set_program_ex.size`, causing
> truncation and parse failures downstream in the EC firmware stack.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: lightbar: Limit payload to max packet size
      commit: ed1d1f519c56c6c2ffa13f3d52cd77beb023db13

Thanks!
