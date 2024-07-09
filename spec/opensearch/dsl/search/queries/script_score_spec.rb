# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

require_relative '../../../../spec_helper'

describe OpenSearch::DSL::Search::Queries::ScriptScore do
  describe '#to_hash' do
    let(:search) do
      described_class.new
    end

    it 'can be converted to a hash' do
      expect(search.to_hash).to eq(script_score: {})
    end
  end

  context 'when options methods are called' do
    let(:search) do
      described_class.new
    end

    describe '#query' do
      before do
        search.query('bar')
      end

      it 'applies the option' do
        expect(search.to_hash[:script_score][:query]).to eq('bar')
      end
    end

    describe '#boost' do
      before do
        search.boost('bar')
      end

      it 'applies the option' do
        expect(search.to_hash[:script_score][:boost]).to eq('bar')
      end
    end

    describe '#script' do
      before do
        search.script('bar')
      end

      it 'applies the option' do
        expect(search.to_hash[:script_score][:script]).to eq('bar')
      end
    end

    describe '#min_score' do
      before do
        search.min_score('bar')
      end

      it 'applies the option' do
        expect(search.to_hash[:script_score][:min_score]).to eq('bar')
      end
    end
  end

  describe '#initialize' do
    context 'when a block is provided' do
      let(:search) do
        described_class.new do
          query do
            term foo: 'bar'
          end

          script source: 'foo',
                 params: { foo: 'bar' }
          boost 'bar'
          min_score 'bar'
        end
      end

      it 'executes the block' do
        expect(search.to_hash[:script_score][:query][:term][:foo]).to eq('bar')
        expect(search.to_hash[:script_score][:script][:source]).to eq('foo')
        expect(search.to_hash[:script_score][:script][:params]).to eq(foo: 'bar')
        expect(search.to_hash[:script_score][:boost]).to eq('bar')
        expect(search.to_hash[:script_score][:min_score]).to eq('bar')
      end
    end
  end
end
